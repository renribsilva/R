###############################################################################
############################## Script Quadro 6.2 ##############################
###############################################################################

# Executa o script binomial_table
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/STANDARD_TABLES/Poisson_table.R")

# Distribuição binomial para k=0:12, quando n = 14 e p = 0.3
px <- dpois(0:17, lambda = 5.2)

# Outra possibilidade é
# px <- Poisson_table(0:17, lambda = 5.2)

# Cria a um dataframe
qua6_2<-data.frame(x = 0:17, pdf = px, cdf = cumsum(px))

# Imprime a tabela
print(kable(qua6_2, caption = "Probabilidades de Poisson"))
