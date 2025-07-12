###############################################################################
############################## Script Tabela 2.6 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria a tabela 2.6
tab2_6 <- tab2_1$x_Sal_Min %>% 
  cut(breaks = seq(2,30,by=4),
      right=TRUE, 
      labels = c(4,8,12,16,20,24,30)) %>%
  table(dnn = "Classes") %>% 
  as.data.frame() %>%
  mutate(`Ponto_Médio` = seq(2, 30, by = 4)[-1] - diff(seq(2, 30, by = 4))/2,
         `Porcentagem` = round((`Freq`/sum(`Freq`))*100, digits = 2))

str(tab2_6)
