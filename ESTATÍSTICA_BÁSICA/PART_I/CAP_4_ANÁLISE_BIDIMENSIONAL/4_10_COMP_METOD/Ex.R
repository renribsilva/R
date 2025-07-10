###############################################################################
############################### Script Exemplo ################################
###############################################################################

# Executa o script da função qq_plot
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/BI/qq_plot.R")

# Execut a base de dados em que m = n
source("./AN_EX_DADOS/CAP_4_ANÁLISE_BIDIMENSIONAL/4_7_GRÁF_QQ/Tab4_18.R")

# Cria a base de dados em que m != n
set.seed(1)

df <- data.frame(x = sort(c(rnorm(20), rep(NA, times = 20)), na.last = T), 
                 y = sort(rnorm(40)))

# Cria o gráfico
qq_plot(df, var1 = "x", var2 = "y")
qq_plot(df4_18, var1 = "prova2", var2 = "prova1")
