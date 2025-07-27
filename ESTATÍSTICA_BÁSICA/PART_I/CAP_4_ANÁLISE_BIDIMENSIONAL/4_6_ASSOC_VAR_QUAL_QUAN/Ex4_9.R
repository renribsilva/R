###############################################################################
############################# Script Exemplo 4.9 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Executa o script da função varp
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/var_bi.R")

# Calcula a medida de associação R2 entre as variáveis
var_bi(tab2_1, var1 = "Grau_de_Instrução", var2 = "x_Sal_Min", sample = FALSE)
