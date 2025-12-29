###############################################################################
############################## Script Tabela 4.6 ##############################
###############################################################################

# Executa a função dist_conj
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/4_3_ASSOC_VAR_QUAL/Tab4_5.R")

# Monta a tabela de distribuição conjunta das proporções (em porcentagem) 
# de alunos segundo o sexo (X) e o curso escolhido (Y), margin == 2
tab4_6 <- tabela_contingência(df4_5, 
                    varx = "sexo",
                    vary = "curso",
                    dist = "rel",
                    margin = 2,
                    expected = F)

# Imprime o dataframe
print(tab4_6)
