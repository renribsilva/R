###############################################################################
############################## Script Tabela 4.10 #############################
###############################################################################

# Executa a função dist_conj
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/4_4_MED_ASSOC_VAR_QUAL/Tab4_8.R")

# Cria a tabela
tab4_10 <- tabela_contingência(df4_8,
                     vary = "estado",
                     varx = "tipo_de_cooperativa",
                     dist = "dev")

# Imprime a tabela
print(tab4_10)

