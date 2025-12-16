###############################################################################
############################## Script Tabela 4.3 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Executa o script da função dist_conj
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Monta a tabela de distribuição conjunta das proporções (em porcentagem)
# em relação ao total geral das variáveis X e Y
tab4_3 <- tabela_contingência(tab2_1, 
                    vary = "Região_de_Procedência",
                    varx = "Grau_de_Instrução",
                    dist = "rel",
                    margin = 0,
                    expected = F)

# Imprime a tabela
print(tab4_3)
