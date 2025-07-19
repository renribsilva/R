###############################################################################
############################## Script Quadroo 3.1 #############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Executa o script da função summary2
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/UNI/summary2.R")

# Medidas resumo para a base de dados dos municípios (n=30)
qua3_1a <- summary(tab_CD_municípios$População)
qua3_1b <- summary2(tab_CD_municípios$População)

# Medidas resumo para a base de dados dos municípios, desconsiderando São Paulo e Rio de Janeiro (n=28)
qua3_1c <- summary(tab_CD_municípios$População[-c(1:2)])
qua3_1d <- summary2(tab_CD_municípios$População[-c(1:2)])

print(qua3_1a)
print(qua3_1b)
print(qua3_1c)
print(qua3_1d)
