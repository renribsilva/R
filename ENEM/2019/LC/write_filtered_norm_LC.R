#--------------------------------
# Importa os table_filtered.csv -
#--------------------------------

filtered <- fread("2019/MICRODADOS/table_filtered.csv")
source("2019/process_area.R")

filtered <- filtered %>%
  dplyr::filter(NU_NOTA_LC != 0) %>%
  dplyr::filter(TP_PRESENCA_LC == 1)

#----------------------------------
# Importa os parâmetros dos itens -
#----------------------------------

itens_2019 <- fread(input='2019/MICRODADOS/microdados_enem_2019/DADOS/ITENS_PROVA_2019.csv')
itens_2019_filtered <- itens_2019 %>%
  dplyr::filter(CO_PROVA == 511 | CO_PROVA == 512 | CO_PROVA == 513 | CO_PROVA == 514 | CO_PROVA == 521 | CO_PROVA == 525 |
                CO_PROVA == 507 | CO_PROVA == 508 | CO_PROVA == 509 | CO_PROVA == 510 | CO_PROVA == 520 | CO_PROVA == 524 |
                CO_PROVA == 503 | CO_PROVA == 504 | CO_PROVA == 505 | CO_PROVA == 506 | CO_PROVA == 519 | CO_PROVA == 523 |
                CO_PROVA == 515 | CO_PROVA == 516 | CO_PROVA == 517 | CO_PROVA == 518 | CO_PROVA == 522 | CO_PROVA == 526)

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

#----------------------------------------------------------------------
# Normaliza o vetor de repostas tendo como referência a prova amarela -
#----------------------------------------------------------------------

# Linguagens
LC_provas <- list(
  azul    = 511,
  amarela = 512,
  rosa    = 513,
  branca  = 514,
  laranja = 521,
  verde = 525
)

seq_code_LC <- list(
  azul_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  azul_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  branca_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$branca) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  branca_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$branca) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == LC_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO)
)

gab_amarela_ing <- filtered[which(filtered$CO_PROVA_LC == 512 & filtered$TP_LINGUA == 0)[1],]$TX_GABARITO_LC
gab_amarela_esp <- filtered[which(filtered$CO_PROVA_LC == 512 & filtered$TP_LINGUA == 1)[1],]$TX_GABARITO_LC

n <- nrow(filtered)
v_gabaritos <- filtered$TX_GABARITO_LC
v_respostas  <- filtered$TX_RESPOSTAS_LC

for (i in seq_len(n)) {
  
  prova_origem <- filtered$CO_PROVA_LC[i]
  idioma_atual <- filtered$TP_LINGUA[i]
  
  if (prova_origem %in% c(LC_provas$azul, LC_provas$rosa, LC_provas$branca, LC_provas$laranja, LC_provas$verde)) {
    
    chave <- paste(prova_origem, idioma_atual, sep = "_")
    
    seq_origem_bruta <- switch(
      chave,
      "511_0" = seq_code_LC$azul_0,    "511_1" = seq_code_LC$azul_1,
      "513_0" = seq_code_LC$rosa_0,    "513_1" = seq_code_LC$rosa_1,
      "514_0" = seq_code_LC$branca_0,  "514_1" = seq_code_LC$branca_1,
      "521_0" = seq_code_LC$laranja_0, "521_1" = seq_code_LC$laranja_1,
      "525_0" = seq_code_LC$verde_0,   "525_1" = seq_code_LC$verde_1,
      NULL # Caso a prova não esteja mapeada
    )
    
    if (is.null(seq_origem_bruta)) stop(sprintf("Erro: Chave %d não está mapeada", chave))
    
    resp_orig_string <- filtered$TX_RESPOSTAS_LC[i]
    resp_orig_vetor  <- strsplit(resp_orig_string, "")[[1]]
    
    # Validação de comprimento
    if (length(resp_orig_vetor) != 45) stop(sprintf("Erro: Tamanho %d na linha %d", length(resp_orig_vetor), i))
    
    # Vetorização com match
    seq_ama_ref <- if (idioma_atual == 0) seq_code_LC$amarela_0 else seq_code_LC$amarela_1
    indices <- match(seq_ama_ref$CO_ITEM, seq_origem_bruta$CO_ITEM)
    
    if (any(is.na(indices))) stop(paste("Item não encontrado na prova", prova_origem, "linha", i))
    
    novo_txt_respostas <- paste0(resp_orig_vetor[indices], collapse = "")
    gab_ref <- if (idioma_atual == 0) gab_amarela_ing else gab_amarela_esp
    
    # Validação de Score (Soma de acertos deve ser idêntica)
    score_novo <- sum(process_area(novo_txt_respostas, gab_ref))
    score_orig <- sum(process_area(resp_orig_string, filtered$TX_GABARITO_LC[i]))
    
    if (score_novo == score_orig) {
      v_gabaritos[i] <- gab_ref
      v_respostas[i]  <- novo_txt_respostas
    } else {
      stop(sprintf("Erro integridade na linha %d: Original %d != Novo %d", i, score_orig, score_novo))
    }
  }
  
  if (i %% 1000 == 0) cat("Processado:", i, "/", n, "\n")
}

# Atualiza o dataframe de uma só vez (Operação atômica e rápida)
filtered$TX_GABARITO_LC <- v_gabaritos
filtered$TX_RESPOSTAS_LC <- v_respostas

#-----------------------------------------------------
# Relação entre quantidade de acertos e proficiência -
#-----------------------------------------------------

write.csv(filtered, file = paste0("2019/MICRODADOS/filtered_norm_LC.csv"), row.names = FALSE)

