###############################################################################
################################ Script Quadro 3.4 ############################
###############################################################################

# Executa a base de dados
source("~/R/ESTATÍSTICA_BÁSICA/AN_EX_DADOS/INPUT/INPUT_Tab_CD_Poluição.R")

# Cria e imprime o quadro
qua3_4 <- summary(tab_CD_poluição$temp)
print(qua3_4)
