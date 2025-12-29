###############################################################################
############################## Script Tabela CM 1 #############################
###############################################################################

#Limpa o Environment
rm(list=ls())

# Cria um data frame em que cada empregado é uma observação
tab_CM1 <- read.delim2("PART_I/DADOS/CM1.txt", sep = " ") %>%
  as_tibble() %>%
  as.data.frame() %>%
  mutate(Prop = paste(Prop*100,"%", sep = ""))

# Cria um vetor para armazenar os valores repetidos
v1 = as.numeric()
v2 = as.numeric()

# Percorre os intervalos, desagrupando os valores
for (i in 1:length(tab_CM1$N_Empregados)) {
  # Determina os valores a serem repetidos
  valores1 <- tab_CM1$Freq_Abs[i]
  # Repete os valores de acordo com a frequência absoluta
  v1 <- c(v1, rep(valores1, times = tab_CM1$Ampl[i]))
  # Determina os valores a serem repetidos
  valores2 <- tab_CM1$Dens_fi[i]
  # Repete os valores de acordo com a frequência absoluta
  v2 <- c(v2, rep(valores2, times = tab_CM1$Ampl[i]))
}

# Cria um vetor para armazenar os valores repetidos
df_CM1 <- data.frame("Freq" = v1,
                      "Dens_fi" = v2)

# Cria um data frame para ser plotado
df_CM1 <- cbind(df_CM1, as.data.frame(seq(1:260), nm = "N_de_Empregados"))

str(df_CM1)
