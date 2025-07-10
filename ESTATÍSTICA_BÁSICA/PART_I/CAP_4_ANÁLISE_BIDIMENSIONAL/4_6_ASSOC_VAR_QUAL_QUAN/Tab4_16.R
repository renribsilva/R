###############################################################################
############################## Script Tabela 4.16 #############################
###############################################################################

# Executa a base de dados
source("./AN_EX_DADOS/INPUT/INPUT_Tab2_1.R")

# Executa o script da função varp
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/UNI/varp.R")

# Executa o script da função summary_bi
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/BI/summary_bi.R")

# Calcula as medidas-resumo para a variável Salário, segundo o grau de 
# instrução
tab4_16 <- summary_bi(tab2_1, var1 = "Grau_de_Instrução", var2 = "x_Sal_Min")

print(kable(tab4_16,digits = 2,caption="**Tabela 4.16:** Medidas-resumo para a variável salário, segundo grau de instrução, na Companhia MB."))

