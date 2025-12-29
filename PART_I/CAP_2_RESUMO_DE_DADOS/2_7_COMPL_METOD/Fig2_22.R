###############################################################################
############################# Script Figura 2.22 #############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig2_22 <- ggplot(tab2_1, aes(x = x_Sal_Min)) +
  stat_ecdf(colour = "black",
            linewidth = 1.005,
            pad = TRUE) +
  labs(y = "Frequência\nacumulada",
       x = "Salário (x salário mínimo)",
       title = "Função de distribuição empírica") +
  scale_x_continuous(breaks = seq(0,24, by = 2)) +
  scale_y_continuous(breaks = seq(0,1, by = 0.1)) +
  theme_minimal() +
  theme(axis.title.y = element_text(angle = 0))

# Plota o gráfico
plot(fig2_22)
