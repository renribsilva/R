###############################################################################
################################ Script Quadro 3.3 ############################
###############################################################################

# Executa a função summary2
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/UNI/summary2.R")

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Notas.R")

# Gera o Quadro 3.3
Qua3_3 <- summary2(tab_CD_notas$Notas)

# Imprime o quadro
print(Qua3_3)
