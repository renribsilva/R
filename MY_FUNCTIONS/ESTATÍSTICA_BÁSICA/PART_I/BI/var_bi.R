var_bi <- function(data, var1, var2, sample) {
  
  # Cria objetos para as funções
  nc <- colnames(data)
  v1 <- which(nc == var1)
  v2 <- which(nc == var2)
  x <- NULL
  y <- NULL
  
  # Discrimina a variável quantitativa da qualitativa
  if (!(is.factor(data[[v1]])) & !(is.factor(data[[v2]]))) {
  stop("Uma das variáveis devem ter a classe fator")
  
  } else {
  
  if (is.factor(data[[v1]])) {x <- data[[v2]]; y <- data[[v1]]
  } else if (is.factor(var2)) {x <- data[[v1]]; y <- data[[v2]]}
  }
  
  # Cria uma função de variância para uma população
  varp <- function(x){
  # calcula a variância amostral e multiplica por (n-1)/n
  var(x)*(length(x)-1)/length(x)
  }
  
  # Calcula a variância da variável quantitativa por categoria, discriminando
  # o tipo de dados, se amostra ou população
  v <- NULL
  if (sample == TRUE) {v <- tapply(x, y, var)
  } else if (sample == FALSE) {v <- tapply(x, y, varp)}
  
  # Calcula a variância média ponderada
  w <- tapply(x, y, length)
  var_mean <- ((sum(v * w) / sum(w)))
  
  # Calcula a variância da variável quantitativa global
  var_total <- NULL
  if (sample == TRUE) {var_total <- var(x)
  } else if (sample == FALSE) {var_total <- varp(x)}
  
  # Calcula o R^2
  R2 <- 1-(var_mean/var_total)
  
  quanti <- names(data)[if(is.factor(v1)) v2 else v1]
  quali <- names(data)[if(is.factor(v1)) v1 else v2]
  
  cat("Medidas de associação entre", quanti, "e", quali, "\n\n")
  cat("Variância total: ", var_total, "\n")
  cat("Variância média ponderada: ", var_mean, "\n" )
  cat("Grau de associação: ", R2, "\n")
  cat("\n\"", round(R2*100, digits = 0), "% da variação total de", quanti, "é explicada\n pela variável", quali, "\"")

}


