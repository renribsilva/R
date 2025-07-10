simetria_uv <- function(x, col = "nome_coluna") {
  
  # Cria vetores para receber as iterações
  ui <- as.numeric()
  vi <- as.numeric()
  # Cria objetos para a função
  nomes_colunas <- colnames(x)
  p <- which(nomes_colunas == col)
  n <- length(x[[p]])
  
  # Itera para variáveis de comprimento par
  if (n %% 2 == 0) {
    ui <- sort(median(x[[p]]) - sort(x[[p]])[1:(n/2)])
    vi <- sort(sort(x[[p]], decreasing = TRUE)[1:(n/2)] - median(x[[p]]))
    
    # Itera para variáveis de comprimento ímpar    
  } else {
    ui <- sort(median(x[[p]]) - sort(x[[p]])[1:c((n+1)/2)])
    vi <- sort(sort(x[[p]], decreasing = TRUE)[1:c((n+1)/2)] - median(x[[p]]))
  }
  
  # Monta e retorna um dataframe com os valores de ui e vi
  df <- data.frame("ui" = ui, "vi" = vi)
  return(df)
}
