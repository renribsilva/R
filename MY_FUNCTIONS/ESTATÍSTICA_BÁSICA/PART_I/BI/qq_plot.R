qq_plot <- function(data, var1, var2) {
  
  # Verifica se as variáveis de entrada existem no conjunto de dados
  if (!(var1 %in% colnames(data)) || !(var2 %in% colnames(data))) {
    stop("Uma ou ambas as variáveis de entrada não estão presentes no conjunto de dados.")
  }
  
  # Cria objetos para a posição das variáveis no data frame
  nc <- colnames(data)
  v1 <- which(nc == var1)
  v2 <- which(nc == var2)
  
  # Retorna o tamanho das variáveis, descartados os valores NA
  l1 <- length(data[[v1]] %>% na.omit())
  l2 <- length(data[[v2]] %>% na.omit())
  
  n <- NULL
  m <- NULL
  
  # Seleciona o menor vetor guardando-o em m e o maior em n
  if (l1>l2) {
    n <- length(data[[v1]] %>% na.omit())
    m <- length(data[[v2]] %>% na.omit())
  } else {
    m <- length(data[[v1]] %>% na.omit())
    n <- length(data[[v2]] %>% na.omit())
  }
  
  # Condicionais
  if (m != n) {
    
    j <- as.numeric()
    
    for(i in 1:m) {
      j <- c(j, ((n/m)*(i-0.5))+0.5)
    }

    if (!(any(as.integer(j) == j)) & (length(r) == 1)) {
      
      k <- as.numeric()
      r <- as.numeric()
      
      for (l in 1:length(j)) {
        k <- c(k, floor(j[l]))
        r <- c(r, round(j[l] %% 1, digits = 2)) %>% unique()
      }
      
      qx <- as.numeric()
      
      for (p in 1:length(k)) {
        
        col <- NULL
        if(l1>l2) col <- data[[v1]] else col <- data[[v2]]
        qx <- c(qx, ((1-r)*col[k[p]] + r*col[k[p]+1]))
        
      }
      
      label_x <- NULL
      label_y <- NULL
      
      if (l1 > l2) {
        label_x <- attributes(data)$names[v1]
        label_y <- attributes(data)$names[v2]
      } else {
        label_y <- attributes(data)$names[v1]
        label_x <- attributes(data)$names[v2]
      }
      
      cminor <- NULL
      
      if (l1>l2) {cminor <- data[[v2]]} else {cminor <- data[[v1]]}
      
      df1 <- data.frame(x = qx, y = na.omit(cminor))
      gg <- ggplot(df1, mapping = aes(x = x, y = y)) +
        geom_point() +
        geom_abline(intercept = 0, slope = 1) +
        labs(x = label_x,
             y = label_y,
             title = paste("Grafico q x q para as variáveis:", label_x, "(eixo x) e", label_y, "(eixo y)")) +
        theme(panel.background = element_blank(),
              panel.border = element_rect(colour = "black", fill = NA))
      
      gg
      
    } else {
      
      f <- c("Em j=k+r, ou k não é inteiro ou r não é único")
      
    }
    
  } else {
    
    attributes(data)$names[v1] -> label_x
    attributes(data)$names[v2] -> label_y
    attributes(data)$names[v1] <- "x"
    attributes(data)$names[v2] <- "y" 
    
    gg <- ggplot(data, mapping = aes(x = x, y = y)) +
      geom_point() +
      geom_abline(intercept = 0, slope = 1) +
      labs(x = label_x,
           y = label_y,
           title = paste("Grafico q x q para as variáveis:", label_x, "(eixo x) e", label_y, "(eixo y)")) +
      theme(panel.background = element_blank(),
            panel.border = element_rect(colour = "black", fill = NA))
    
    gg
    
  }
}
