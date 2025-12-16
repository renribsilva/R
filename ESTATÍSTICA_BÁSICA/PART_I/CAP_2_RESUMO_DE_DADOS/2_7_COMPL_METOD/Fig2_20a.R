###############################################################################
############################# Script Figura 2.20a #############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig2_20a <- ggplot(tab2_1, aes(x = x_Sal_Min)) +
  geom_histogram(mapping = aes(y = ..density..),
                 breaks = seq(2,24, by = 2),
                 colour = "white") +
  scale_x_continuous(breaks = seq(2,24, by = 2)) +
  lims(y = c(0, 0.12)) +
  labs(x = "Classes de salário (x salário mínimo)",
       y = "Densidade de frequência",
       title = "Histograma para a variável S: salário, Δ = 2.") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank())
  
# Plota o gráfico
plot(fig2_20a)
