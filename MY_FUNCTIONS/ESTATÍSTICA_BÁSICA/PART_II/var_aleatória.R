var_aleatória <- function (data, var) {
  
  v <- which( var == colnames(data))
  unique_values <- unique(data[[v]])
  m <- matrix(0, length(unique_values), 2, dimnames = list(c(),c("p(x)", "x")))
  
  for (i in seq_along(unique_values)) {
    m[i,] <- data %>%
      dplyr::filter(data[[v]] == unique_values[i]) %>%
      dplyr::select(Probabilidade) %>%
      apply(MARGIN = 2, FUN = sum) %>%
      cbind(unique_values[i], deparse.level = 0)
  }
  
  m
  
}