smooth_cdf <- function(vetor){
  n <- length(vetor)
  f <- t <- table(vetor)
  st <- sum(t[1:n])
  for(i in 1:n) {
    f[i] <- sum(t[1:i])/st - (t[i]/st)/2
  }
  f <- f %>% as.data.frame()
  f$x <- f$x %>% as.character() %>% as.numeric()
  return(f)
}