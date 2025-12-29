###############################################################################
############################# Script Figura 2.17 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Poluição.R")

# Cria o gráfico
fig2_17 <- ggplot(tab_CD_poluição, aes(x = `temp`)) +
  geom_dotplot(stat = "density",
               binwidth = 0.1,
               stackratio = 2,
               stackdir = "up") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  labs(x = "Temperatura (°C)",
       title = "Gráfico de dispersão unidimensional para os dados de temperatura\nde São Paulo no ano de 1991.")

# Plota o gráfico
plot(fig2_17)
