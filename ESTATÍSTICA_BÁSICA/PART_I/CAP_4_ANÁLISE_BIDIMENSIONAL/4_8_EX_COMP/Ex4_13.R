###############################################################################
############################# Script Exemplo 4.13 #############################
###############################################################################

source("PART_I/INPUT/INPUT_Tab_CD_Mercado.R")

source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/corr_table.R")

corr_table(tab_CD_mercado, var1 = "Telebrás", var2 = "Ibovespa")
