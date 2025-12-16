chisq_test <- function(data, 
                       vary = "variável distribuída na vertical", 
                       varx = "variável distrubuída na horizontal") {
  
  # Cria objetos para a posição das variáveis no data frame
  nc <- colnames(data)
  vx <- which(nc == varx)
  vy <- which(nc == vary)
  
  # Cria uma matrix com a distribuição conjunta em frequência absoluta
  tab <- table(data[[vy]], data[[vx]])
  
  # Cria marginais vazios
  row_total <- apply(tab, MARGIN = 2, FUN = sum)
  col_total <- apply(tab, MARGIN = 1, FUN = sum)
  
  # Cria uma matrix vazia
  tab2 <- matrix(data = NA, nrow = dim(tab)[1], ncol = dim(tab)[2])
  
  # Substitui por valores esperados
  for(j in 1:dim(tab)[2]) {
    for(i in 1:dim(tab)[1]) {
      tab2[i,j] <- round(prop.table(unlist(row_total))[j]*
                           apply(tab, MARGIN = 1, FUN = sum)[i])
    }
  }
  
  # Calcula os resíduos relacionados à diferença entre o valor observado 
  # e o valor esperado
  RES1 <- purrr::map2(tab, tab2, `-`) %>% matrix(ncol = dim(tab2)[2])
  RES2 <- purrr::map2(tab, tab2, function(x,y) abs(x-y)-0.5) %>% matrix(ncol = dim(tab2)[2])
  DEV <- NULL
  
  if (min(unlist(tab)) >= 5) {
    
    # Cria uma matrix com o desvios de cada classe 
    DEV <- purrr::map2(matrix(unlist(lapply(
      RES1, function(x) x^2)), nrow = nrow(RES1)), 
      tab2, function(x, y) (x / y)) %>%
      matrix(ncol = dim(tab2)[2])
    
  } else {
    
    # Cria uma matrix com o desvios de cada classe, aplicando a 
    # correção de Yates
    DEV <- purrr::map2(matrix(unlist(lapply(
      RES2, function(x) x^2)), nrow = nrow(RES2)), 
      tab2, function(x, y) (x / y)) %>%
      matrix(ncol = dim(tab2)[2])
    
  }
  
  # Cria objetos para os testes
  X <- sum(unlist(DEV)) %>% round(digits = 1) # Qui-quadrado
  N <- sum(unlist(row_total)) # Total de observações
  E <- min(unlist(tab))
  DF <- (((dim(tab)[1])-1)*((dim(tab)[2])-1)) # Graus de liberdade
  TAB <- paste(dim(tab)[1], "x", dim(tab)[2])
  P <- NA
  Q <- sqrt(((dim(tab)[1])-(1))/(dim(tab)[1])) %>% 
    as.numeric() %>% round(digits = 2)
  
  c <- c("Values")
  l <- c("Tabela de contingência", 
         "Qui-quadrado de Pearson: ", 
         "Degrees of freedom: ", 
         "p-valores")
  
  if ((E >= 5) & (N >= 40)) {
    
    m <- matrix(c(TAB, X, DF, P), nrow = 4, ncol = 1, dimnames = list(l,c))
    m
    
  } else {
    
    l[2] <- c("Qui-quadrado de Pearson (correção de Yates: ")
    m <- matrix(c(TAB, X, DF, P), nrow = 4, ncol = 1, dimnames = list(l,c))
    m
      
  }
}