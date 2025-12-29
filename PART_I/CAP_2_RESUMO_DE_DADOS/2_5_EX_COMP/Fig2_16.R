###############################################################################
############################## Script Figura 2.16 #############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Poluição.R")

# Cria o gráfico
fig2_16 <- ggplot(tab_CD_poluição, aes(x = `temp`)) +
  geom_histogram(breaks = seq(12, 21, by = 1),
                 colour = "white") +
  stat_bin(geom="text", 
           aes(label = ..count.., y = ..count.., vjust = -0.8),
           breaks = seq(12, 21, by = 1)) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50")) +
  lims(y = c(0,33)) +
  labs(x = "Temperatura (°C)",
       y = "Frequência absoluta",
       title = "Histograma dos dados de temperatura de São Paulo no ano de 1991.")

# Plota o gráfico
plot(fig2_16)
