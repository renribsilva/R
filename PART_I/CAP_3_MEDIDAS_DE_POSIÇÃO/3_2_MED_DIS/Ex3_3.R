###############################################################################
############################# Script Exemplo 3.3 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

n <- length(purrr::discard(tab2_1$N_de_Filhos, is.na))

# Gera a média da variável N_de_Filhos
m3_3 <- mean(tab2_1$N_de_Filhos, na.rm = T)

# Gera manualmente um vetor com os desvios em relação à media
c3_3 <- as.numeric()

for(i in 1:length(purrr::discard(tab2_1$N_de_Filhos, is.na))) {
  c3_3[i] <- (purrr::discard(tab2_1$N_de_Filhos, is.na)[i] - 
  mean(tab2_1$N_de_Filhos, na.rm = T))
}

# Gera manualmente o desvio médio da variável N_de_Filhos
dm3_3 <-  sum(abs(c3_3))/length(purrr::discard(tab2_1$N_de_Filhos, is.na))
print(dm3_3)

# Gera a variância de AMOSTRA da variável N_de_Filhos
var3_3a <- sum(c3_3^2/(n-1))
print(var3_3a)

# Gera a variância considerando a AMOSTRA como sendo a população total de dados
var3_3b <- var(tab2_1$N_de_Filhos, na.rm = T)*(n-1)/n
print(var3_3b)

# Gera o desvio-padrão da AMOSTRA da variável N_de_Filhos
sd3_3a <- sqrt(var3_3a)
print(sd3_3a)

# Gera o desvio-padrão considerando a AMOSTRA como sendo a população total de dados
sd3_3b <- sd(tab2_1$N_de_Filhos, na.rm=T)*(n-1)/n
print(sd3_3b)

  