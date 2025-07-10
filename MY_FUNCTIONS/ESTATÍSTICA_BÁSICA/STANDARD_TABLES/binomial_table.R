binomial_table <- function(k, n, p) {
  
  # Verifica os argumentos
  if(missing(p)) p <- seq(0.05, 0.95, by = 0.10)
  if (length(n) != 1 || !is.numeric(n) || n <= 0 || n %% 1 != 0) stop("n deve ser um número natural positivo")
  if (max(k) > n || min(k) < 0) stop("O valor de k não pode ser menor que 0 ou maior que n")
  
  # Cria uma matriz vazia
  m <- matrix(NA, nrow = length(k), ncol = length(p))
  
  # Para cada valor de k
  for (i in seq_along(k)) {
    
    for (j in seq_along(p)) {
      
      m[i, j] <- choose(n, k[i]) * (p[j]^k[i]) * ((1 - p[j])^(n - k[i]))
      
    }
  }
  
  # Dá nome às linhas e colunas
  rownames(m) <- k
  colnames(m) <- paste(p)
  
  cat("\n")
  cat("Distribuição binomial: X ~ b(n, p)", "\n")
  cat("Corpo da tabela dá as probabilidades P(X = k), k = 0, 1, ..., n", "\n")
  cat("\n")
  return(m)
  
}
