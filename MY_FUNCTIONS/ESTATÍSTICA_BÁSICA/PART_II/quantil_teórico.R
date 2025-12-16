quantil_teórico <- function(data, var, qp) {
  
  colnames <- colnames(data)
  v <- which(var == colnames(data))
  
  # Tabula a variável e calcula as frequências absolutas
  tab <- table(data[[v]]) %>%
    sort() %>%
    as.data.frame() %>%
    mutate(Rel = prop.table(Freq)) %>%
    mutate(Cum = cumsum(Rel))
  
  # Verifica os argumentos
  if (missing(qp)) qp <- c(0.25, 0.5, 0.75)
  
  m <- matrix(NA, length(qp)+2, 1)
  m[1,1] <- min(data[[v]])
  m[nrow(m),1] <- max(data[[v]])
  
  for (i in 1:length(qp)) {
      m[i+1,1] <- as.character(
        paste(
          unique(
            c(
              tab$Var1[match(TRUE, tab$Cum >= qp[i])], 
              tab$Var1[match(FALSE, tab$Cum <= qp[i])])), collapse = " e "))
    
  }
  
  dn <- NULL
  
  for (l in 1:length(qp)) {
    
    dn <- c(dn, paste0("Q(", qp[l], ")"))
    
  }
    
  dimnames(m) <- list(c("Min", dn, "Max"), c("Values"))
  cat("Quantis teóricos da variável aleatória ", var,"\n\n")
  return(m)
  
}
