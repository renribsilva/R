corr_plot <- function(data, var1, var2, scale) {
  
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
  
  # Monta um dataframe com os valores computados e os totais
  df <- data.frame(row.names = rownames(data),
                   x = data[[vx]],
                   y = data[[vy]],
                   devx = devx,
                   devy = devy,
                   zx = zx,
                   zy = zy,
                   xy = xy) %>%
    round(digits = 2)
  
  # Cria um objeto vazio para receber a disperção gráfica
  gg <- NULL
    
  if (scale == "default") {
    
    gg <- ggplot(df, aes(x = devx, y = devy)) +
      geom_point() +
      scale_y_continuous(expand = expansion(mult = c(0.15, 0.15))) +
      scale_x_continuous(expand = expansion(mult = c(0.15, 0.15))) +
      theme(panel.background = element_blank(),
            panel.border = element_rect(colour = "black", fill = NA)) +
      labs(title = "Disperção dos desvios de cada observação em relação à média")
    
    plot(gg)
    
  } else if (scale == "trans") {
    
    gg <- ggplot(df, aes(x = zx, y = zy)) +
      geom_point() +
      scale_y_continuous(expand = expansion(mult = c(0.15, 0.15))) +
      scale_x_continuous(expand = expansion(mult = c(0.15, 0.15))) +
      theme(panel.background = element_blank(),
            panel.border = element_rect(colour = "black", fill = NA)) +
      labs(title = "Disperção dos desvios de cada observação em relação à média")
    
    plot(gg)
  }
}