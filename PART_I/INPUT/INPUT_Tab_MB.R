###############################################################################
############################### Script Tabela MB ##############################
###############################################################################

# Importa o arquivo "MB.txt"
tab_MB <- read.delim2("~/R/ESTATÍSTICA_BÁSICA/AN_EX_DADOS/DADOS/MB.txt", sep = " ") %>%
  mutate(Seção = as.factor(Seção),
         Inglês = as.factor(Inglês),
         Metodologia = as.factor(Metodologia))

str(tab_MB)