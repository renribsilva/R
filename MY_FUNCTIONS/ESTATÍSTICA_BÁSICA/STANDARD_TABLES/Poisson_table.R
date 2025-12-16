Poisson_table <- function(k, n, p, lambda, t) {
  
  ncol <- NULL
  
  # Verifica as variáveis
  if (min(k) < 0) stop("O valor mínimo de k é 0")
  if (!missing(lambda)) {
    if (!missing(n) || !missing(p)) {
      stop("Se lambda está especificado, então os parâmetros n e p não devem ser fornecidos.")
    }
    ncol <- length(lambda)
    t <- if (missing(t)) 1 else t
  } else {
    if ((!missing(n) && missing(p)) || (missing(n) && !missing(p))) {
      stop("Se n é especificado, então p também deve ser, e vice-versa")
    }
    lambda <- if (missing(n) && missing(p)) c(0.001, 0.01, 0.1, 1, 2, 3, 4, 5, 6, 7) else n * p
    ncol <- length(lambda)
    t <- if (missing(t)) 1 else t
  }
  
  # Cria uma matriz vazia
  m <- matrix(NA, nrow = length(k), ncol = ncol)
  
  # Para cada valor de k
  for (i in seq_along(k)) {
    
    for (j in seq_along(lambda)) {
      
      m[i,j] <- (exp(-lambda[j]*t)*((lambda[j]*t)^k[i]))/factorial(k[i])
      
    }
  }
  
  rownames(m) <- k
  colnames(m) <- lambda
  
  # Título da tabela
  cat("\n")
  cat("Distribuição de Poisson: X ~ Pois(λ)", "\n")
  cat("Corpo da tabela dá as probabilidades P(X = k), k = 0, 1, ..., n", "\n")
  cat("\n")
  return(m)
  
}
