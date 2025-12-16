coeficiente_variação <- function(vetor) {
  coef <- sd(x)/mean(x)*100
  return(coef)
}