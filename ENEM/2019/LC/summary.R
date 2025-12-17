#--------------------------------
# Importa os table_filtered.csv -
#--------------------------------

filtered <- fread("2019/MICRODADOS/table_filtered.csv")
source("2019/process_area.R")

filtered <- 

#----------------------------------
# Normaliza o vetor de linguagens -
#----------------------------------

# Vetores lógicos para decidir transformação
cond_L0 <- filtered$TP_LINGUA == 0 & nchar(filtered$TX_GABARITO_LC) > 45
cond_L1 <- filtered$TP_LINGUA == 1 & nchar(filtered$TX_GABARITO_LC) > 45

# Sempre remover "9" das respostas onde as condições forem verdade
cond_total <- cond_L0 | cond_L1
filtered$TX_RESPOSTAS_LC[cond_total] <- gsub("9", "", filtered$TX_RESPOSTAS_LC[cond_total])

# Ajuste do gabarito para TP_LINGUA == 0
filtered$TX_GABARITO_LC[cond_L0] <- paste0(
  substr(filtered$TX_GABARITO_LC[cond_L0], 1, 5),
  substr(filtered$TX_GABARITO_LC[cond_L0], 11, 9999)
)

# Ajuste do gabarito para TP_LINGUA == 1
filtered$TX_GABARITO_LC[cond_L1] <- substr(filtered$TX_GABARITO_LC[cond_L1], 6, 9999)
which(filtered$NU_NOTA_LC == 0)
LC_mat <- process_area(filtered$TX_RESPOSTAS_LC, filtered$TX_GABARITO_LC)
plot(rowSums(LC_mat), filtered$NU_NOTA_LC)
filtered[2222,]
mirt::plot(filtered$NU_NOTA_LC, 
           rowSums(LC_mat), 
           main = "Relação entre quantidade de acertos e proficiência", 
           xlab = "Proficiência", 
           ylab = "Quantidade de acertos",
           # xlim = c(-4, 4),  # Ajustando o limite do eixo X para de -4 a 4
           ylim = c(min(rowSums(LC_mat)), max(rowSums(LC_mat))),  # Ajuste automático do limite do eixo Y
           cex = 0.1,
           cex.axis = 1)

abline(v = 628, lty = 2, lwd = 0.5, col = 'gray')
abline(h = 33, lty = 2, lwd = 0.5, col = 'gray')
