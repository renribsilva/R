###############################################################################
################################ Script Fig 3.11 ##############################
###############################################################################

source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Cria o histograma e transforma a variável com o logarítmo natural ou neperiano
fig3_12a <- ggplot(data = tab_CD_municípios) +
  geom_histogram(mapping = aes(x = log(População)),
                 breaks = seq(3.5,7, by = 0.5),
                 colour = "white") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)),
                     breaks = seq(0,14, by = 2)) +
  labs(title = "Histograma para os dados transformados. CD-Municípios",
       x = "ln(P)",
       y = "Frequência absoluta") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

# Cria o histograma e transforma a variável com raiz de índice 4
fig3_12b <- ggplot(data = tab_CD_municípios) +
  geom_histogram(mapping = aes(x = População^(1/4)),
                 breaks = seq(2.5,6, by = 0.5),
                 colour = "white") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2))) +
                    # breaks = seq(0,14, by = 2)) +
  labs(title = "Histograma para os dados transformados. CD-Municípios",
       x = expression(P^(1/4)),
       y = "Frequência absoluta") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

# Cria o histograma e transforma a variável com raíz quadrática
fig3_12c <- ggplot(data = tab_CD_municípios) +
  geom_histogram(mapping = aes(x = População^(1/2)),
                 breaks = seq(5,35, by = 5),
                 colour = "white") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2))) +
  # breaks = seq(0,14, by = 2)) +
  scale_x_continuous(breaks = seq(5,50, by = 5)) +
  labs(title = "Histograma para os dados transformados. CD-Municípios",
       x = expression(P^(1/2)),
       y = "Frequência absoluta") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

# Cria o histograma e transforma a variável com raíz de índice 3
fig3_12d <- ggplot(data = tab_CD_municípios) +
  geom_histogram(mapping = aes(x = População^(1/3)),
                 breaks = seq(3,10, by = 1),
                 colour = "white") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2))) +
  # breaks = seq(0,14, by = 2)) +
  scale_x_continuous(breaks = seq(2,10, by = 1)) +
  labs(title = "Histograma para os dados transformados. CD-Municípios",
       x = expression(P^(1/3)),
       y = "Frequência absoluta") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

# Plota os histogrmas
print(plot_grid(fig3_12a, fig3_12b, fig3_12c, fig3_12d))
