###############################################################################
############################## Script Tabela 4.4 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Executa o script da função dist_conj
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Monta a tabela de distribuição conjunta das proporções (em porcentagem)
# em relação aos totais de cada coluna da variável X
tab4_4a <- tabela_contingência(tab2_1, 
                    varx = "Grau_de_Instrução",
                    vary = "Região_de_Procedência",
                    dist = "rel",
                    margin = 2,
                    expected = F)

# Monta a tabela de distribuição conjunta das proporções (em porcentagem)
# em relação aos totais de cada linha da variável Y
tab4_4b <- tabela_contingência(tab2_1, 
                     varx = "Grau_de_Instrução",
                     vary = "Região_de_Procedência",
                     dist = "rel",
                     margin = 1,
                     expected = F)

# Imprime a tabela
print(tab4_4a)
print(tab4_4b)
