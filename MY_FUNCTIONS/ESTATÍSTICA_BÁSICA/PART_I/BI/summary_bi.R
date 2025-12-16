summary_bi <- function(data, var1, var2) {

  nc <- colnames(data)
  v1 <- which(nc == var1)
  v2 <- which(nc == var2)
  x <- NULL
  y <- NULL
  
  if (!(is.factor(data[[v1]])) & !(is.factor(data[[v2]]))) {
    stop("Uma das variáveis devem ter a classe fator")
    
  } else {
    
    if (is.factor(data[[v1]])) {x <- data[[v2]]; y <- data[[v1]]
    } else if (is.factor(var2)) {x <- data[[v1]]; y <- data[[v2]]}
  }
  
  # Calcula as medidas-resumo da variável quantitativa por categoria
  tapply(x, y, summary) -> A # Quantis, média e mediana
  tapply(x, y, varp) -> B # Variância
  tapply(x, y, length) -> C # Comprimento
  
  
  # Acresce em A, B, C os totais
  A[[4]] <- summary(x) # Quantis, média e mediana            
  B[[4]] <- varp(x) # Variância                
  C[[4]] <- length(x) # Comprimento 
  
  # Cria uma matrix com a lista de A
  tab <- matrix(unlist(A), ncol = 6, byrow = TRUE)
  tab <- cbind(C, tab, sqrt(B), B)
  dimnames(tab) <- list(
    c(levels(y), "Total"),
    c("n", "Min.","Q1","Mediana","Média","Q3","Max.","dp(S)","Var(S)"))
  
  tab
  
}