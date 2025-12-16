#------------------------
# Importa os sample.csv -
#------------------------

sample <- fread("2019/LC/sample_LC.csv")

#-----------------------------------
# Cria a matriz de acertos e erros -
#-----------------------------------

# Função para processar cada área
process_area <- function(respostas, gabarito) {
  # transforma em lista de vetores e coloca NA em "." ou "*"
  r <- lapply(strsplit(respostas, ""), function(x) {
    x[x %in% c(".", "*")] <- NA
    x
  })
  # transforma gabarito em lista de vetores
  g <- strsplit(gabarito, "")
  # compara e transforma TRUE/FALSE em 1/0 mantendo NA
  comp_list <- mapply(function(r, g) {
    if (length(r) != length(g)) {
      stop("Erro: respostas e gabarito com comprimentos diferentes.")
    }
    res <- r == g
    as.integer(res)
  }, r, g, SIMPLIFY = FALSE)
  # junta em matriz
  mat <- do.call(rbind, comp_list)
  # substitui todos os NA por 0
  mat[is.na(mat)] <- 0
  return(mat)
}

# processa cada área
LC_mat <- process_area(sample$TX_RESPOSTAS_LC, sample$TX_GABARITO_LC)
# CH_mat <- process_area(sample$TX_RESPOSTAS_CH, sample$TX_GABARITO_CH)
# CN_mat <- process_area(sample$TX_RESPOSTAS_CN, sample$TX_GABARITO_CN)

# combina todas as áreas na ordem LC, CH, CN, MT
colnames(LC_mat) <- paste0("q", 1:45)
# colnames(CH_mat) <- paste0("q", 46:90)
# colnames(CN_mat) <- paste0("q", 91:135)

#---------------------------------
# Cria o modelo mirt 3PL para LC -
#---------------------------------

# Ajudar o parâmetro g para o caso de 'chute' para 5 alternativas
# https://download.inep.gov.br/avaliacao_da_alfabetizacao/documentos_tecnicos/especificacoes_configuracoes_equalizacao_mirt.pdf

mod <- 'F = 1-45'

pars <- mirt(LC_mat, model = mod, itemtype = "3PL", pars = "values")
# pars <- mirt(CH_mat, model = mod, itemtype = "3PL", pars = "values")
# pars <- mirt(CN_mat, model = mod, itemtype = "3PL", pars = "values")
idx_a1 <- which(pars$name == "a1")
idx_g <- which(pars$name == "g")
idx_u <- which(pars$name == "u")
idx_d <- which(pars$name == "d")

# prior logit-normal
pars$prior.type[idx_a1] <- "lnorm"
pars$prior_1[idx_a1]    <- log(1.7)
pars$prior_2[idx_a1]    <- 0.5

pars$prior.type[idx_d] <- "norm"
pars$prior_1[idx_d]   <- 0
pars$prior_2[idx_d]   <- 3

pars$prior.type[idx_g] <- "norm"
pars$prior_1[idx_g]    <- -1.386
pars$prior_2[idx_g]    <- 0.5

pars$prior.type[idx_u] <- "norm"
pars$prior_1[idx_u]   <- 0
pars$prior_2[idx_u]   <- 1

# modelo com calibração
model_LC_pars <- mirt(LC_mat, model = mod, itemtype = "3PL", pars = pars)
saveRDS(model_LC_pars, "2019/LC/model_LC_pars.rds")