###############################################################################
############################# Script Figura 2.12 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Notas.R")

# Cria o gráfico
fig2_12 <- ggplot(tab_CD_notas, aes(x = `Notas`)) +
  geom_histogram(breaks = seq(1,10, by = 1),
                 colour = "white") +
  scale_x_continuous(breaks = seq(1,10, by = 1)) +
  stat_bin(breaks = seq(1,10, by = 1),
           mapping = aes(y = ..count.., label = ..count..),
           geom = "text",
           vjust = -0.5) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50")) +
  lims(y = c(0,26)) +
  labs(x = "Classes de Notas",
       y = "Frequência absoluta",
       title = "Histograma para o CD-Notas. R")

# Plota o gráfico
plot(fig2_12)