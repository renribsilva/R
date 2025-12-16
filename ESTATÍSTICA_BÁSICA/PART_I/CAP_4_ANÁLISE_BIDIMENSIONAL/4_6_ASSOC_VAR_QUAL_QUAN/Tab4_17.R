###############################################################################
############################## Script Tabela 4.9 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Executa o script da função varp
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/UNI/varp.R")

# Executa o script da função summary_bi
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/summary_bi.R")

# Calcula as medidas-resumo para a variável Salário, segundo o grau de 
# instrução
tab4_17 <- summary_bi(tab2_1, var1 = "Região_de_Procedência", var2 = "x_Sal_Min")

print(kable(tab4_17,digits = 2,caption="**Tabela 4.16:** Medidas-resumo para a variável salário, segundo grau de instrução, na Companhia MB."))

