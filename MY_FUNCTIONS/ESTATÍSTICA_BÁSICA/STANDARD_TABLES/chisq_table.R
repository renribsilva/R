chisq_table <- function(df, alpha) {
  
  # Verifica os argumentos
  if (missing(alpha)) alpha <- seq(0.95, 0.05, by = -0.15)
  if (df[1] < 1) stop ("O valor mínimo para o parâmetro Degrees of Freedom é 1")
  
  # Cria uma matrix varia para receber os valores
  m <- matrix(NA, nrow = length(df), ncol = length(alpha))
  
  # Itera um função para cada elemento da matriz
  for (i in seq_along(df)) {
    
    for (j in seq_along(alpha)) {
      
      m[i, j] <- qchisq(1 - alpha[j], df[i])
      
    }
  }
  
  # Dá nome às linhas e colunas
  rownames(m) <- df
  colnames(m) <- paste("α:", alpha)
  
  #Título da tabela
  cat("\n")
  cat("Tabela de distribuição do Qui-quadrado: Y ~ X(v)", "\n")
  cat("Corpo da tabela dá os valores yc tais que P(Y > yc) = p")
  cat("\n")
  return(m)
  
}
