###############################################################################
############################## Script Figura 2.2 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria um gráfico de barras
fig2_2 <- ggplot(
  tab2_1, aes(x = Grau_de_Instrução)
  ) +
  geom_bar(stat = "count") +
  geom_text(aes(label = after_stat(count)), stat = "count", vjust = -0.5)  +
  scale_x_discrete(expand = expansion(mult = c(0.4, 0.4))) +
  lims(y = c(0, max(table(tab2_1$Grau_de_Instrução))+1)) +
  labs(y = "Frequência absoluta",
       x= "Grau de Instrução",
       title = "Gráfico em barras para a variável: grau de instrução.") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50"))

# Plota o gráfico
plot(fig2_2)