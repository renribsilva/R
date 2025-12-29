###############################################################################
############################# Script Tabela 6.4 ###############################
###############################################################################

# Executa a base de dados
source("PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_2_CONCEITO/Tab6_5.R")

# Executa a função var_aleatória
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_II/var_aleatória.R")

# Cria a tabela
tab6_6 <- var_aleatória(df6_5, var = "X")

# Imprime a tabela
print(kable(tab6_6, caption = "Distribuição da v.a. Custo_recuperação_Y."))
