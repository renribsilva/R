###############################################################################
############################## Script Figura 2.23 #############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig2_23 <- ggplot(tab2_1, aes(x = N_de_Filhos)) +
  stat_ecdf(colour = "black",
            linewidth = 1.005,
            pad = TRUE) +
  labs(y = "Frequência\nacumulada",
       x = "Número de filhos",
       title = "Função de distribuição empírica") +
  scale_x_continuous(breaks = seq(0,5, by = 1), expand = expansion(mult = c(0.1,0.3))) +
  scale_y_continuous(breaks = seq(0,1, by = 0.1)) +
  theme_minimal() +
  theme(axis.title.y = element_text(angle = 0))

# Plota o gráfico
plot(fig2_23)

