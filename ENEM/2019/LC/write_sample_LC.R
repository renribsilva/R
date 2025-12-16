#--------------------------------
# Importa os table_filtered.csv -
#--------------------------------

filtered <- fread("2019/MICRODADOS/table_filtered.csv")
source("2019/process_area.R")

filtered <- filtered [
  TP_LINGUA == 0 & 
    (CO_PROVA_LC == 511 | CO_PROVA_LC == 512 | CO_PROVA_LC == 513 | CO_PROVA_LC == 514) &
    (CO_PROVA_CH == 507 | CO_PROVA_CH == 508 | CO_PROVA_CH == 509 | CO_PROVA_CH == 510) &
    (CO_PROVA_CN == 503 | CO_PROVA_CN == 504 | CO_PROVA_CN == 505 | CO_PROVA_CN == 506) &
    (CO_PROVA_MT == 515 | CO_PROVA_MT == 516 | CO_PROVA_MT == 517 | CO_PROVA_MT == 518)
]

#----------------------------------
# Normaliza o vetor de linguagens -
#----------------------------------

# Vetores lógicos para decidir transformação
cond_L0 <- filtered$TP_LINGUA == 0 & nchar(filtered$TX_GABARITO_LC) > 45
cond_L1 <- filtered$TP_LINGUA == 1 & nchar(filtered$TX_GABARITO_LC) > 45

# Sempre remover "9" das respostas onde as condições forem verdade
cond_total <- cond_L0 | cond_L1
filtered$TX_RESPOSTAS_LC[cond_total] <- gsub("9", "", filtered$TX_RESPOSTAS_LC[cond_total])

# Ajuste do gabarito para TP_LINGUA == 0
filtered$TX_GABARITO_LC[cond_L0] <- paste0(
  substr(filtered$TX_GABARITO_LC[cond_L0], 1, 5),
  substr(filtered$TX_GABARITO_LC[cond_L0], 11, 9999)
)

# Ajuste do gabarito para TP_LINGUA == 1
filtered$TX_GABARITO_LC[cond_L1] <- substr(filtered$TX_GABARITO_LC[cond_L1], 6, 9999)

#--------------------
# Calcula a amostra -
#--------------------

# N é o tamanho das observações
# e é a margem de erro
# c é o intervalo de confiança
# p é a proporção esperada
calc_sample_size <- function(N, e, c, p) {
  Z <- qnorm(1-(1-c)/2)
  n0 <- (Z^2*p*(1-p))/(e^2)
  return (as.integer(ceiling(n0)))
}

sample_size <- calc_sample_size(N=Inf, e=0.005, c = 0.99, p = 0.5)

indices_aleatorios <- sample.int(n = nrow(filtered), size = sample_size*2, replace = FALSE)
sample <- filtered[indices_aleatorios, ]

# Encontra meus dados
my_score <- filtered %>%
  dplyr::filter(NU_NOTA_LC == 628.7) %>%
  dplyr::filter(NO_MUNICIPIO_PROVA == "Votuporanga")

# Inclui meus dados a sample
sample <- rbind(sample, my_score)

#----------------------------------------------------------------------
# Normaliza o vetor de repostas tendo como referência a prova amarela -
#----------------------------------------------------------------------

itens_2019 <- fread(input='2019/MICRODADOS/microdados_enem_2019/DADOS/ITENS_PROVA_2019.csv')
itens_2019_filtered <- itens_2019 %>%
  dplyr::filter(CO_PROVA == 511 | CO_PROVA == 512 | CO_PROVA == 513 | CO_PROVA == 514 |
                  CO_PROVA == 507 | CO_PROVA == 508 | CO_PROVA == 509 | CO_PROVA == 510 |
                  CO_PROVA == 503 | CO_PROVA == 504 | CO_PROVA == 505 | CO_PROVA == 506 |
                  CO_PROVA == 515 | CO_PROVA == 516 | CO_PROVA == 517 | CO_PROVA == 518 )

# Linguagens
LC_provas <- list(
  azul    = 511,
  amarela = 512,
  rosa    = 513,
  branca  = 514
)

seq_code_LC <- list(
  azul = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  branca = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$branca) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO)
)

gab_amarela <- sample[which(sample$CO_PROVA_LC == 512)[1],]$TX_GABARITO_LC

for (i in seq_len(nrow(sample))) {
  
  prova_origem <- sample[i, ]$CO_PROVA_LC
  
  if (prova_origem %in% c(LC_provas$azul, LC_provas$rosa, LC_provas$branca)) {
    
    seq_origem <- switch(
      as.character(prova_origem),
      "511" = seq_code_LC$azul,
      "513" = seq_code_LC$rosa,
      "514" = seq_code_LC$branca
    )
    
    new_TX_RESPOSTAS_LC <- character(nrow(seq_code_LC$amarela))
    g <- strsplit(sample[i, ]$TX_RESPOSTAS_LC, "")[[1]]
    
    for (k in seq_len(nrow(seq_code_LC$amarela))) {
      
      index <- match(
        seq_code_LC$amarela$CO_ITEM[k],
        seq_origem$CO_ITEM
      )
      
      if (is.na(index)) {
        stop(sprintf(
          "Erro: CO_ITEM %s não encontrado na prova %s.",
          seq_code_LC$amarela$CO_ITEM[k],
          prova_origem
        ))
      }
      
      new_TX_RESPOSTAS_LC[k] <- g[index]
    }
    
    score1 <- process_area(
      paste0(new_TX_RESPOSTAS_LC, collapse = ""),
      gab_amarela
    )
    
    score2 <- process_area(
      sample[i, ]$TX_RESPOSTAS_LC,
      sample[i, ]$TX_GABARITO_LC
    )
    
    if (sum(score1) == sum(score2)) {
      sample[i, ]$TX_GABARITO_LC <- gab_amarela
      sample[i, ]$TX_RESPOSTAS_LC <- paste0(new_TX_RESPOSTAS_LC, collapse = "")
    } else {
      stop(sprintf(
        "Erro: Score1 é diferente de score2",
        sum(score1),
        sum(score2)
      ))
    }
  }
  cat("Linha processada:", i, "\n")
}

#----------------
# Escreve p csv -
#----------------

write.csv(sample, file = "2019/LC/sample_LC.csv", row.names = FALSE)
