#--------------------------------
# Importa os table_filtered.csv -
#--------------------------------

filtered <- fread("table_filtered.csv")

#------------------------------------------------------------------------
# Calcula o tamanho da amosta com intervalo de confiança para proporção -
#------------------------------------------------------------------------

# N é o tamanho das observações
# e é a margem de erro
# c é o intervalo de confiança
# p é a proporção esperada
calc_sample_size <- function(N, e, c, p) {
  Z <- qnorm(1-(1-c)/2)
  n0 <- (Z^2*p*(1-p))/(e^2)
  return (as.integer(ceiling(n0)))
}

sample_size <- calc_sample_size(N=Inf, e=0.005, c = 0.99, p = 0.5)

#--------------------
# Escreve sample.csv-
#--------------------

set.seed(123)  # Defina uma semente para reprodutibilidade (opcional)
indices_aleatorios <- sample.int(n = nrow(filtered), size = sample_size, replace = FALSE)
sample <- filtered[indices_aleatorios, ]

# Vetores lógicos para decidir transformação
cond_L0 <- sample$TP_LINGUA == 0 & nchar(sample$TX_GABARITO_LC) > 45
cond_L1 <- sample$TP_LINGUA == 1 & nchar(sample$TX_GABARITO_LC) > 45

# Sempre remover "9" das respostas onde as condições forem verdade
cond_total <- cond_L0 | cond_L1
sample$TX_RESPOSTAS_LC[cond_total] <- gsub("9", "", sample$TX_RESPOSTAS_LC[cond_total])

# Ajuste do gabarito para TP_LINGUA == 0
sample$TX_GABARITO_LC[cond_L0] <- paste0(
  substr(sample$TX_GABARITO_LC[cond_L0], 1, 5),
  substr(sample$TX_GABARITO_LC[cond_L0], 11, 9999)
)

# Ajuste do gabarito para TP_LINGUA == 1
sample$TX_GABARITO_LC[cond_L1] <- substr(sample$TX_GABARITO_LC[cond_L1], 6, 9999)

write.csv(sample, file = "MICRODADOS/sample.csv", row.names = FALSE)
