###############################################################################
############################# Script Tabela 6.2 ###############################
###############################################################################

# Executa a base de dados
source("PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_2_CONCEITO/Tab6_2.R")

# Executa a função var_aleatória
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_II/var_aleatória.R")

# Cria a tabela
tab6_3 <- var_aleatória(df6_2, var = "Lucro_montagem_X")

# Imprime a tabela
print(kable(tab6_3, caption = "Distribuição da v.a. Lucro_montagem_X."))
