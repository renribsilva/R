corr_table <- function(data, var1, var2) {
  
  # Cria objetos para a posição das variáveis no data frame
  nc <- colnames(data)
  vx <- which(nc == var1)
  vy <- which(nc == var2)
  x <- data[[vx]]
  y <- data[[vy]]
  
  # Realiza as operações matemáticas sobre as coordenadas  
  devx <- x - mean(x)
  devy <- y - mean(y)
  zx <- devx/sqrt(var(x, na.rm = T)*(length(x)-1)/length(x))
  zy <- devy/sqrt(var(y, na.rm = T)*(length(y)-1)/length(y))
  xy <- zx*zy
  
  # Cria a linha com os totais da tabela
  total <- data.frame(row.names = "Total",
                      x = sum(data[[vx]]),
                      y = sum(data[[vy]]),
                      devx = sum(devx),
                      devy = sum(devy),
                      zx = NA,
                      zy = NA,
                      xy = sum(xy))
  
  # Monta um dataframe com os valores computados e os totais
  df <- data.frame(row.names = rownames(data),
                   x = data[[vx]],
                   y = data[[vy]],
                   devx = devx,
                   devy = devy,
                   zx = zx,
                   zy = zy,
                   xy = xy) %>%
    rbind(total) %>%
    round(digits = 2)
  
  cat("\n", "Coeficiente de correlação: ", sum(xy)/length(xy), "\n")
  cat("\n", "Grau de associação linear: ", paste0(round((sum(xy)/length(xy))*100, digits = 1),"%"), "\n\n")
  print(df)
  
}
