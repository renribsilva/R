###############################################################################
############################# Script Tabela 6.4 ###############################
###############################################################################

# Executa a base de dados
source("PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_2_CONCEITO/Tab6_2.R")

# Executa a função var_aleatória
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_II/var_aleatória.R")

# Cria a tabela
tab6_4 <- var_aleatória(df6_2, var = "Custo_recuperação_Y")

# Imprime a tabela
print(kable(tab6_4, caption = "Distribuição da v.a. Custo_recuperação_Y."))
