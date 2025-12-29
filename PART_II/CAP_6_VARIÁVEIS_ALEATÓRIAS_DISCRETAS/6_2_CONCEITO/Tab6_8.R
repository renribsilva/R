###############################################################################
############################# Script Tabela 6.8 ###############################
###############################################################################

# Executa a base de dados
source("PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_2_CONCEITO/Tab6_7.R")

# Executa a função var_aleatória
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_II/var_aleatória.R")

# Cria a tabela
tab6_8 <- var_aleatória(df6_7, var = "Y")

# Imprime a tabela
print(kable(tab6_8, caption = "Distribuição da v.a. Custo_recuperação_Y."))
