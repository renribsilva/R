###############################################################################
############################# Script Exemplo 3.4 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Gera a média de uma variável contínua
m3_4 <- mean(tab2_1$x_Sal_Min)
print(m3_4)

# Gera um vetor com os desvios em relação à media
c3_4 <- as.numeric()

for(i in 1:length(tab2_1$x_Sal_Min)) {
  c3_4[i] <- ((tab2_1$x_Sal_Min)[i] - 
                mean(tab2_1$x_Sal_Min))
}

# Gera o desvio médio da variável contínua N_de_Filhos
dm3_4 <-  sum(abs(c3_4))/length(tab2_1$x_Sal_Min)
print(dm3_4)

# Gera a variância de uma variável contínua 
var3_4a <- sum((c3_4)^2)/length(c3_4)
print(var3_4a)

# Gera o desvio-padrão da variável contínua
sd3_4 <- (sd(tab2_1$x_Sal_Min)*(length(tab2_1$x_Sal_Min)-1))/
  length(tab2_1$x_Sal_Min)
print(sd3_4)
