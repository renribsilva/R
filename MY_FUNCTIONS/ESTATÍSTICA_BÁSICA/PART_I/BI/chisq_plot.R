chisq_plot <- function(data,
                       vary = "var na horiz",
                       varx = "var na vert",
                       type = "uni ou bi",
                       dir = "R, L, AC, AR",
                       alpha = "nível de significância") {

  # Chama a posição das variáveis na base de dados
  nc <- colnames(data)
  vx <- which(nc == varx)
  vy <- which(nc == vary)
  
  # Cria a tabela e suas marginais
  tab <- table(data[[vy]], data[[vx]])
  row_total <- apply(tab, MARGIN = 2, FUN = sum)
  col_total <- apply(tab, MARGIN = 1, FUN = sum)
  
  # Cria uma matrix vazia
  tab2 <- matrix(data = NA, nrow = dim(tab)[1], ncol = dim(tab)[2])
  
  # Mapeia a matriz com valores esperados
  for(j in 1:dim(tab)[2]) {
    for(i in 1:dim(tab)[1]) {
      tab2[i,j] <- round(prop.table(unlist(row_total))[j]*
                           apply(tab, MARGIN = 1, FUN = sum)[i])
    }
  }
  
  # Cria uma matrix com os resíduos
  tab_dev_abs <- purrr::map2(tab, tab2, `-`) %>%
    matrix(ncol = dim(tab2)[2])
  
  # Cria um vetor com os desvios relativos aos valores esperados
  A <- purrr::map2(matrix(unlist(lapply(
    tab_dev_abs, function(x) x^2)), nrow = nrow(tab_dev_abs)), 
    tab2, function(x, y) round(x / y, digits = 1)) %>%
    unlist()
  
  # Cria um dataframe para plotagem
  df <- data.frame(A = A)
  
  # Cria um objeto com o grau de liberdade
  DF <- (((dim(tab)[1])-1)*((dim(tab)[2])-1))
  
  # Cria objetos vazios para receber os pontos da abscissa do stat_function
  x0 <- as.numeric()
  xi <- as.numeric()
  xs <- as.numeric()
  xn <- as.numeric()
  ggtitle <- as.character()
  gglegend <- as.character()
  
  # Mapeia os pontos da abscissa
  if (type == "uni") {
    
    if (dir == "R") {
      
      x0 <- min(A)
      xi <- min(A)
      xs <- as.numeric(quantile(A, probs = 1-alpha))
      xn <- max(A)
      ggtitle <- paste("Distribuição Qui-Quadrado (df =", 
                       DF, ", qui =", xs, ")")
      gglegend <- c("Valores críticos\nde qui-quadrado")
      
    } else if (dir == "L") {
      
      x0 <- min(A)
      xi <- as.numeric(quantile(A, probs = alpha))
      xs <- max(A)
      xn <- max(A)
      ggtitle <- paste("Distribuição Qui-Quadrado (df =", 
                       DF, ", qui =", xi, ")")
      gglegend <- c("Valores críticos\nde qui-quadrado")
      
    }
  } else if (type == "bi") {
    
    if (dir == "AC") {
      
      x0 <- as.numeric(quantile(A, probs = (alpha/2)))
      xi <- as.numeric(quantile(A, probs = 1-(alpha/2)))
      xs <- max(A)
      xn <- max(A)
      ggtitle <- paste("Distribuição Qui-Quadrado (df =", 
                       DF, ", qui =", x0, "e", xi,  ")")
      gglegend <- c("Valores confiáveis\nde qui-quadrado")
      
    } else if (dir == "AR") {
      
      x0 <- min(A)
      xi <- as.numeric(quantile(A, probs = (alpha/2)))
      xs <- as.numeric(quantile(A, probs = 1-(alpha/2)))
      xn <- max(A)
      ggtitle <- paste("Distribuição Qui-Quadrado (df =", 
                       DF, ", qui =", xi, "e", xs,  ")")
      gglegend <- c("Valores críticos\nde qui-quadrado")
      
    }
  }
  
  # Cria uma fun para a stat_function
  custom_density <- function(x, data) {
    dens <- density(data)
    approx(dens$x, dens$y, xout = x)$y
  }
  
  # Cria o gráfico de distribuição do qui-quadrado
  gg <- ggplot(df, aes(x = A)) +
    geom_line(stat = "density") +
    stat_function(aes(fill = gglegend),
                  fun = function(x) custom_density(x, df$A), 
                  geom = "area",
                  alpha = 0.5,
                  xlim = c(x0, xi)) +
    stat_function(aes(fill = gglegend),
                  fun = function(x) custom_density(x, df$A), 
                  geom = "area",
                  alpha = 0.5,
                  xlim = c(xs, xn)) +
    scale_fill_discrete(type = c("skyblue")) +
    guides(fill = guide_legend(title = paste0("α = ", alpha))) +
    labs(title = ggtitle,
         x = "Qui-quadrado",
         y = "Densidade de frequência") +
    theme(panel.background = element_blank(),
          panel.border = element_rect(colour = "black", fill = NA))
  
  gg
  
}
