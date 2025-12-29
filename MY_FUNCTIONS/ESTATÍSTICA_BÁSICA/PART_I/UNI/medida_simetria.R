# Determina o número de classes que dados contínuos podem ter, de tal modo
# que aprensentem a menor distância em relação à curva de densidade, em
# acordo com as proposições de Freedman e Diaconis (1981)

medida_simetria <- function(x, col = "nome_da_coluna") {
  
  # Cria objetos para a função
  nomes_colunas <- colnames(x)
  p <- which(nomes_colunas == col)
  
  # Realiza as operações matemáticas para encontrar o número de classes
  dq <- summary(x[[p]])[[5]] - summary(x[[p]])[[2]]
  q1 <- summary(x[[p]])[[2]]
  q2 <- summary(x[[p]])[[3]]
  q3 <- summary(x[[p]])[[5]]
  
  A <- ((q3-q2)-(q2-q1))/(q3-q1)
  
  cat("\t\t\tMedida de simetria de Pearson\n\n")
  
  if (A == 0) {
    
    cat("Distribuição perfeitamente simétrica: ", A, )
    
  } else if (A > 0) {
    
    cat("Distribuição assimétrica à direita: ", A)
    
  } else if (A < 0) {
    
    cat("Distribuição assimétrica à esquerda: ", A)
    
  }
  cat("\n")
  cat("Limites: (-1,1)")
}
