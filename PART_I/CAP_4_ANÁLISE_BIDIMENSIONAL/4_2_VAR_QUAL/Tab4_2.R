###############################################################################
############################## Script Tabela 4.2 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Executa a função dist_conj
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Monta a tabela de distribuição conjunta das frequências absolutas das 
# variáveis grau de instrução (X) e região de procedência (Y).
tab4_2 <- tabela_contingência(tab2_1, 
          varx = "Grau_de_Instrução",
          vary = "Região_de_Procedência",
          dist = "abs")

print(tab4_2)
