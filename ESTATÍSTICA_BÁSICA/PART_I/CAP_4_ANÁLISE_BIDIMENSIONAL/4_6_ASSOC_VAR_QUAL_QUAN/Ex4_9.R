###############################################################################
############################# Script Exemplo 4.9 ##############################
###############################################################################

# Executa a base de dados
source("./AN_EX_DADOS/INPUT/INPUT_Tab2_1.R")

# Executa o script da função varp
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/BI/var_bi.R")

# Calcula a medida de associação R2 entre as variáveis
var_bi(tab2_1, var1 = "Grau_de_Instrução", var2 = "x_Sal_Min", sample = FALSE)
