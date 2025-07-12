###############################################################################
############################## Script Tabela 2.5 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria a tabela 2.5
tab2_5 <- tab2_1$Grau_de_Instrução %>%
  table(dnn = "Grau_de_Instrução") %>%
  as.data.frame() %>%
  mutate(Freq_Rel_Porc = round((prop.table(Freq)*100), digits = 0))

# Insere nova linha com Total
tab2_5 <- tab2_5 %>%
  rbind(data.frame("Grau_de_Instrução" = c("Total"),
                   "Freq" = c(sum(tab2_5$Freq)),
                   "Freq_Rel_Porc" = c(sum(tab2_5$Freq_Rel_Porc))))

str(tab2_5)
