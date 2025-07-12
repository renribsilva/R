###############################################################################
############################## Script Tabela 2.4 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria uma tabela com Classes de Salário
tab2_4 <- tab2_1$x_Sal_Min %>%
  cut(breaks = seq(3,27,by=4), right=FALSE, include.lowest = TRUE) %>%
  table(dnn = "Grau_de_Instrução") %>%
  as.data.frame() %>%
  mutate(Freq_Rel_Porc = round(prop.table(Freq), digits = 2)*100)

# Insere linha de Total
tab2_4 <- tab2_4 %>%
  rbind(data.frame("Grau_de_Instrução" = c("Total"),
                   "Freq" = c(sum(tab2_4$Freq)),
                   "Freq_Rel_Porc" = c(sum(tab2_4$Freq_Rel_Porc))))

str(tab2_4)
