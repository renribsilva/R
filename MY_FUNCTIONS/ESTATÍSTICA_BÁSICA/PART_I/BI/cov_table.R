cov_table <- function(data, var1, var2) {
  
  data <- df4_12
  var1 <- "X"
  var2 <- "Y"
  
  # Cria objetos para a posição das variáveis no data frame
  nc <- colnames(data)
  vx <- which(nc == var1)
  vy <- which(nc == var2)
  x <- data[[vx]]
  y <- data[[vy]]
  
  # Realiza as operações matemáticas sobre as coordenadas  
  devx <- x - mean(x)
  devy <- y - mean(y)
  pdev <- devx*devy
  
  # Cria a linha com os totais da tabela
  total <- data.frame(row.names = "Total",
                      x = sum(data[[vx]]),
                      y = sum(data[[vy]]),
                      devx = sum(devx),
                      devy = sum(devy),
                      pdev = sum(pdev))
  
  # Monta um dataframe com os valores computados e os totais
  df <- data.frame(row.names = rownames(data),
                   x = data[[vx]],
                   y = data[[vy]],
                   devx = devx,
                   devy = devy,
                   pdev = pdev) %>%
    rbind(total) %>%
    round(digits = 2)
  
  cat("\n", "Covariância: ", sum(pdev)/length(pdev), "\n\n")
  print(df)
  
}
