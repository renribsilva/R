###############################################################################
############################## Script Figura 4.7 ##############################
###############################################################################

# Executa a base de dados
source("./AN_EX_DADOS/CAP_4_ANÁLISE_BIDIMENSIONAL/4_5_ASSOC_VAR_QUAN/Tab4_12.R")

# Executa o script da função corr_table
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/BI/corr_plot.R")

# Executa a função corr_table
gg4_15a <- corr_plot(df4_12, var1 = "X", var2 = "Y", scale = "default")
gg4_15b <- corr_plot(df4_12, var1 = "X", var2 = "Y", scale = "trans")

# Plota as duas distribuições simultaneamente
plot_grid(gg4_15a, gg4_15b)

