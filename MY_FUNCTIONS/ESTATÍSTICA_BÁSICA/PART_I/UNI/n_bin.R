# Determina o número de classes que dados contínuos podem ter, de tal modo
# que aprensentem a menor distância em relação à curva de densidade, em
# acordo com as proposições de Freedman e Diaconis (1981)

n_bins <- function(x, col = "nome_da_coluna") {
  
  # Cria objetos para a função
  nomes_colunas <- colnames(x)
  nomes_colunas
  p <- which(nomes_colunas == col)
  n <- length(x[[p]])
  
  # Realiza as operações matemáticas para encontrar o número de classes
  dq <- summary(x[[p]])[[5]] - summary(x[[p]])[[2]]
  b <- dq*((log(n)/n)^(1/3))
  x1 <- min(purrr::discard(x[[p]], is.na))
  xn <- max(purrr::discard(x[[p]], is.na))
  n_bins <- (xn - x1)/b
  n_bins <- n_bins %>% as.integer()
  return(n_bins)
}
