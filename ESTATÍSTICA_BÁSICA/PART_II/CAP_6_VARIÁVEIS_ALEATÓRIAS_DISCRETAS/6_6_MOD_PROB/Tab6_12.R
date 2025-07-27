###############################################################################
############################# Script Tabela 6.12 ##############################
###############################################################################

# Executa o script da função binomial_table
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/STANDARD_TABLES/binomial_table.R")

# Cria a base de dados
x <- c(0,1,2,3)
px <- dbinom(x = x, size = 3, p = 1/2)

# px pode ser calcula também por binomial_table
# binomial_table(0:3, 3, p = 1/2)

# Cria um dataframe
df6_12 <- data.frame(x, px)

# Imprime a tabela
print(kable(df6_12,digits=3, align = c("r","c"),
            caption="**Tabela 6.12:** Probabilidades binomiais para n=3 e p=1/2"))
