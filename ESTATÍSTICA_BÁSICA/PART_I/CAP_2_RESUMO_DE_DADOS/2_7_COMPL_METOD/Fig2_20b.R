###############################################################################
############################# Script Figura 2.20B #############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig2_20b <- ggplot(tab2_1, aes(x = x_Sal_Min)) +
  stat_density(geom = "line", adjust = 1.5, linewidth = 1.05) +
  labs(x = "Salário",
       y = "Densidade",
       title = "Histograma alisado para a variável S: salário") +
  lims(y = c(0,0.09)) +
  theme(panel.background = element_blank(),
        axis.ticks = element_blank(),
        axis.line = element_line("black"),
        axis.text = element_blank())

# Plota o gráfico
plot(fig2_20b)
