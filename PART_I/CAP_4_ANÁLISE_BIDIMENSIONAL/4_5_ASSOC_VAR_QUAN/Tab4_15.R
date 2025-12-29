###############################################################################
############################## Script Tabela 4.15 #############################
###############################################################################

# Executa a base de dados
source("./AN_EX_DADOS/CAP_4_ANÁLISE_BIDIMENSIONAL/4_5_ASSOC_VAR_QUAN/Tab4_12.R")

################################# CORRELAÇÃO ##################################

# Executa o script da função corr_table
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/BI/corr_table.R")

# Executa a função corr_table
tab4_15a <- corr_table(df4_12, var1 = "X", var2 = "Y")

################################# COVARIÂNCIA #################################

# Executa o script da função corr_table
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/BI/cov_table.R")

# Executa a função cov_table
tab4_15b <- cov_table(df4_12, var1 = "X", var2 = "Y")
