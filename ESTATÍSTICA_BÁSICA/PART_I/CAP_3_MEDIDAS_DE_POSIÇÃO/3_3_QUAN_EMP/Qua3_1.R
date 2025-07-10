###############################################################################
############################## Script Quadroo 3.1 #############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("~/R/ESTATÍSTICA_BÁSICA/AN_EX_DADOS/INPUT/INPUT_Tab_CD_Municípios.R")

# Executa o script da função summary2
source("~/R/MY_FUNCTION/ESTATÍSTICA_BÁSICA/summary2.R")

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
