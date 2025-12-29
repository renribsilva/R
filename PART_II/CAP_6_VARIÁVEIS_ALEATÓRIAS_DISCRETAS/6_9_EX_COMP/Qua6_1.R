###############################################################################
############################## Script Quadro 6.1 ##############################
###############################################################################

# Executa o script binomial_table
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/STANDARD_TABLES/binomial_table.R")

# Distribuição binomial para k=0:12, quando n = 14 e p = 0.3
px <- dbinom(0:12, size=14, p=0.3)

# Outra possibilidade é
px <- binomial_table(0:12, 14, 0.3)

# Cria a um dataframe
qua6_1<-data.frame(x = 0:12, pdf = px, cdf = cumsum(px))

# Imprime a tabela
print(kable(qua6_1, caption = "Probabilidades binomiais"))
