#--------------------------------
# Importa os table_filtered.csv -
#--------------------------------

filtered <- fread("2019/MICRODADOS/table_filtered.csv")
source("2019/process_area.R")

n <- nrow(filtered)

#----------------------------------
# Importa os parâmetros dos itens -
#----------------------------------

itens_2019 <- fread(input='2019/MICRODADOS/microdados_enem_2019/DADOS/ITENS_PROVA_2019.csv')
itens_2019_filtered <- itens_2019 %>%
  dplyr::filter(CO_PROVA == 511 | CO_PROVA == 512 | CO_PROVA == 513 | CO_PROVA == 514 | CO_PROVA == 521 | CO_PROVA == 525 |
                CO_PROVA == 507 | CO_PROVA == 508 | CO_PROVA == 509 | CO_PROVA == 510 | CO_PROVA == 520 | CO_PROVA == 524 |
                CO_PROVA == 503 | CO_PROVA == 504 | CO_PROVA == 505 | CO_PROVA == 506 | CO_PROVA == 519 | CO_PROVA == 523 |
                CO_PROVA == 515 | CO_PROVA == 516 | CO_PROVA == 517 | CO_PROVA == 518 | CO_PROVA == 522 | CO_PROVA == 526)

#-------------
# Linguagens -
#-------------

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

lc_gabaritos <- filtered$TX_GABARITO_LC
lc_respostas  <- filtered$TX_RESPOSTAS_LC

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
      lc_gabaritos[i] <- gab_ref
      lc_respostas[i]  <- novo_txt_respostas
    } else {
      stop(sprintf("Erro integridade na linha %d: Original %d != Novo %d", i, score_orig, score_novo))
    }
  }
  
  if (i %% 1000 == 0) cat("Processado:", i, "/", n, "\n")
}

#-------------------
# Ciências humanas -
#-------------------

# Ciências humanas
CH_provas <- list(
  azul    = 507,
  amarela = 508,
  rosa    = 510,
  branca  = 509,
  laranja = 520,
  verde = 524
)

seq_code_CH <- list(
  azul_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  azul_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  branca_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$branca) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  branca_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$branca) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CH_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO)
)

gab_amarela_ing <- filtered[which(filtered$CO_PROVA_CH == 508 & filtered$TP_LINGUA == 0)[1],]$TX_GABARITO_CH
gab_amarela_esp <- filtered[which(filtered$CO_PROVA_CH == 508 & filtered$TP_LINGUA == 1)[1],]$TX_GABARITO_CH

ch_gabaritos <- filtered$TX_GABARITO_CH
ch_respostas  <- filtered$TX_RESPOSTAS_CH

for (i in seq_len(n)) {
  
  prova_origem <- filtered$CO_PROVA_CH[i]
  idioma_atual <- filtered$TP_LINGUA[i]
  
  if (prova_origem %in% c(CH_provas$azul, CH_provas$rosa, CH_provas$branca, CH_provas$laranja, CH_provas$verde)) {
    
    chave <- paste(prova_origem, idioma_atual, sep = "_")
    
    seq_origem_bruta <- switch(
      chave,
      "507_0" = seq_code_CH$azul_0,    "507_1" = seq_code_CH$azul_1,
      "510_0" = seq_code_CH$rosa_0,    "510_1" = seq_code_CH$rosa_1,
      "509_0" = seq_code_CH$branca_0,  "509_1" = seq_code_CH$branca_1,
      "520_0" = seq_code_CH$laranja_0, "520_1" = seq_code_CH$laranja_1,
      "524_0" = seq_code_CH$verde_0,   "524_1" = seq_code_CH$verde_1,
      NULL # Caso a prova não esteja mapeada
    )
    
    if (is.null(seq_origem_bruta)) stop(sprintf("Erro: Chave %d não está mapeada", chave))
    
    resp_orig_string <- filtered$TX_RESPOSTAS_CH[i]
    resp_orig_vetor  <- strsplit(resp_orig_string, "")[[1]]
    
    # Validação de comprimento
    if (length(resp_orig_vetor) != 45) stop(sprintf("Erro: Tamanho %d na linha %d", length(resp_orig_vetor), i))
    
    # Vetorização com match
    seq_ama_ref <- if (idioma_atual == 0) seq_code_CH$amarela_0 else seq_code_CH$amarela_1
    indices <- match(seq_ama_ref$CO_ITEM, seq_origem_bruta$CO_ITEM)
    
    if (any(is.na(indices))) stop(paste("Item não encontrado na prova", prova_origem, "linha", i))
    
    novo_txt_respostas <- paste0(resp_orig_vetor[indices], collapse = "")
    gab_ref <- if (idioma_atual == 0) gab_amarela_ing else gab_amarela_esp
    
    # Validação de Score (Soma de acertos deve ser idêntica)
    score_novo <- sum(process_area(novo_txt_respostas, gab_ref))
    score_orig <- sum(process_area(resp_orig_string, filtered$TX_GABARITO_CH[i]))
    
    if (score_novo == score_orig) {
      lc_gabaritos[i] <- gab_ref
      lc_respostas[i]  <- novo_txt_respostas
    } else {
      stop(sprintf("Erro integridade na linha %d: Original %d != Novo %d", i, score_orig, score_novo))
    }
  }
  
  if (i %% 1000 == 0) cat("Processado:", i, "/", n, "\n")
}

#-----------------------
# Ciências da natureza -
#-----------------------

# Ciências da natureza
CN_provas <- list(
  azul    = 503,
  amarela = 504,
  cinza    = 505,
  rosa  = 506,
  laranja = 519,
  verde = 523
)

seq_code_CN <- list(
  azul_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  azul_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  cinza_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$cinza) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  cinza_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$cinza) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == CN_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO)
)

gab_amarela_ing <- filtered[which(filtered$CO_PROVA_CN == 508 & filtered$TP_LINGUA == 0)[1],]$TX_GABARITO_CN
gab_amarela_esp <- filtered[which(filtered$CO_PROVA_CN == 508 & filtered$TP_LINGUA == 1)[1],]$TX_GABARITO_CN

cn_gabaritos <- filtered$TX_GABARITO_CN
cn_respostas  <- filtered$TX_RESPOSTAS_CN

for (i in seq_len(n)) {
  
  prova_origem <- filtered$CO_PROVA_CN[i]
  idioma_atual <- filtered$TP_LINGUA[i]
  
  if (prova_origem %in% c(CN_provas$azul, CN_provas$cinza, CN_provas$rosa, CN_provas$laranja, CN_provas$verde)) {
    
    chave <- paste(prova_origem, idioma_atual, sep = "_")
    
    seq_origem_bruta <- switch(
      chave,
      "503_0" = seq_code_CN$azul_0,    "503_1" = seq_code_CN$azul_1,
      "505_0" = seq_code_CN$cinza_0,   "505_1" = seq_code_CN$cinza_1,
      "506_0" = seq_code_CN$rosa_0,    "506_1" = seq_code_CN$rosa_1,
      "519_0" = seq_code_CN$laranja_0, "519_1" = seq_code_CN$laranja_1,
      "523_0" = seq_code_CN$verde_0,   "523_1" = seq_code_CN$verde_1,
      NULL # Caso a prova não esteja mapeada
    )
    
    if (is.null(seq_origem_bruta)) stop(sprintf("Erro: Chave %d não está mapeada", chave))
    
    resp_orig_string <- filtered$TX_RESPOSTAS_CN[i]
    resp_orig_vetor  <- strsplit(resp_orig_string, "")[[1]]
    
    # Validação de comprimento
    if (length(resp_orig_vetor) != 45) stop(sprintf("Erro: Tamanho %d na linha %d", length(resp_orig_vetor), i))
    
    # Vetorização com match
    seq_ama_ref <- if (idioma_atual == 0) seq_code_CN$amarela_0 else seq_code_CN$amarela_1
    indices <- match(seq_ama_ref$CO_ITEM, seq_origem_bruta$CO_ITEM)
    
    if (any(is.na(indices))) stop(paste("Item não encontrado na prova", prova_origem, "linha", i))
    
    novo_txt_respostas <- paste0(resp_orig_vetor[indices], collapse = "")
    gab_ref <- if (idioma_atual == 0) gab_amarela_ing else gab_amarela_esp
    
    # Validação de Score (Soma de acertos deve ser idêntica)
    score_novo <- sum(process_area(novo_txt_respostas, gab_ref))
    score_orig <- sum(process_area(resp_orig_string, filtered$TX_GABARITO_CN[i]))
    
    if (score_novo == score_orig) {
      lc_gabaritos[i] <- gab_ref
      lc_respostas[i]  <- novo_txt_respostas
    } else {
      stop(sprintf("Erro integridade na linha %d: Original %d != Novo %d", i, score_orig, score_novo))
    }
  }
  
  if (i %% 1000 == 0) cat("Processado:", i, "/", n, "\n")
}

#-------------
# Matemática -
#-------------

# Ciências da natureza
MT_provas <- list(
  azul    = 515,
  amarela = 516,
  rosa  = 517,
  cinza  = 518,
  laranja = 522,
  verde = 526
)

seq_code_MT <- list(
  azul_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  azul_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$azul) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  rosa_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$rosa) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  cinza_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$cinza) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  cinza_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$cinza) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  amarela_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$amarela) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  laranja_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$laranja) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_0 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 0 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO),
  
  verde_1 = itens_2019_filtered %>%
    dplyr::filter(CO_PROVA == MT_provas$verde) %>%
    dplyr::filter(TP_LINGUA == 1 | is.na(TP_LINGUA)) %>%
    dplyr::arrange(CO_POSICAO)
)

gab_amarela_ing <- filtered[which(filtered$CO_PROVA_MT == 508 & filtered$TP_LINGUA == 0)[1],]$TX_GABARITO_MT
gab_amarela_esp <- filtered[which(filtered$CO_PROVA_MT == 508 & filtered$TP_LINGUA == 1)[1],]$TX_GABARITO_MT

mt_gabaritos <- filtered$TX_GABARITO_MT
mt_respostas  <- filtered$TX_RESPOSTAS_MT

for (i in seq_len(n)) {
  
  prova_origem <- filtered$CO_PROVA_MT[i]
  idioma_atual <- filtered$TP_LINGUA[i]
  
  if (prova_origem %in% c(MT_provas$azul, MT_provas$rosa, MT_provas$cinza, MT_provas$laranja, MT_provas$verde)) {
    
    chave <- paste(prova_origem, idioma_atual, sep = "_")
    
    seq_origem_bruta <- switch(
      chave,
      "515_0" = seq_code_MT$azul_0,    "515_1" = seq_code_MT$azul_1,
      "517_0" = seq_code_MT$rosa_0,   "517_1" = seq_code_MT$rosa_1,
      "518_0" = seq_code_MT$cinza_0,    "518_1" = seq_code_MT$cinza_1,
      "522_0" = seq_code_MT$laranja_0, "522_1" = seq_code_MT$laranja_1,
      "526_0" = seq_code_MT$verde_0,   "526_1" = seq_code_MT$verde_1,
      NULL # Caso a prova não esteja mapeada
    )
    
    if (is.null(seq_origem_bruta)) stop(sprintf("Erro: Chave %d não está mapeada", chave))
    
    resp_orig_string <- filtered$TX_RESPOSTAS_MT[i]
    resp_orig_vetor  <- strsplit(resp_orig_string, "")[[1]]
    
    # Validação de comprimento
    if (length(resp_orig_vetor) != 45) stop(sprintf("Erro: Tamanho %d na linha %d", length(resp_orig_vetor), i))
    
    # Vetorização com match
    seq_ama_ref <- if (idioma_atual == 0) seq_code_MT$amarela_0 else seq_code_MT$amarela_1
    indices <- match(seq_ama_ref$CO_ITEM, seq_origem_bruta$CO_ITEM)
    
    if (any(is.na(indices))) stop(paste("Item não encontrado na prova", prova_origem, "linha", i))
    
    novo_txt_respostas <- paste0(resp_orig_vetor[indices], collapse = "")
    gab_ref <- if (idioma_atual == 0) gab_amarela_ing else gab_amarela_esp
    
    # Validação de Score (Soma de acertos deve ser idêntica)
    score_novo <- sum(process_area(novo_txt_respostas, gab_ref))
    score_orig <- sum(process_area(resp_orig_string, filtered$TX_GABARITO_MT[i]))
    
    if (score_novo == score_orig) {
      lc_gabaritos[i] <- gab_ref
      lc_respostas[i]  <- novo_txt_respostas
    } else {
      stop(sprintf("Erro integridade na linha %d: Original %d != Novo %d", i, score_orig, score_novo))
    }
  }
  
  if (i %% 1000 == 0) cat("Processado:", i, "/", n, "\n")
}

#-------------------------------------
# Atualiza o dataframe de uma só vez -
#-------------------------------------

filtered$TX_GABARITO_LC <- lc_gabaritos
filtered$TX_RESPOSTAS_LC <- lc_respostas

filtered$TX_GABARITO_CH <- ch_gabaritos
filtered$TX_RESPOSTAS_CH <- ch_respostas

filtered$TX_GABARITO_CN <- cn_gabaritos
filtered$TX_RESPOSTAS_CN <- cn_respostas

filtered$TX_GABARITO_MT <- mt_gabaritos
filtered$TX_RESPOSTAS_MT <- mt_respostas

#-----------------------------------------------------
# Relação entre quantidade de acertos e proficiência -
#-----------------------------------------------------

write.csv(filtered, file = paste0("2019/MICRODADOS/filtered_norm_LC.csv"), row.names = FALSE)

