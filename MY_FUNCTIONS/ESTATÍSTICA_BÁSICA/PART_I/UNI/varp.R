varp <- function(x){
  # calcula a variância amostral e multiplica por (n-1)/n
  var(x, na.rm = TRUE)*(length(x)-1)/length(x)
}