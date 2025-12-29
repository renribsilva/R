###############################################################################
############################## Script Figura 2.4 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico diretamente com transformação dentro do ggplot
fig2_4 <- ggplot(
  data = subset(tab2_1, !is.na(N_de_Filhos)), 
  aes(x = factor(N_de_Filhos, levels = as.character(0:5)))
) +
  geom_bar(stat = "count") +
  geom_text(aes(label = after_stat(count)), stat = "count", vjust = -0.5) +
  scale_x_discrete(name = "Número de filhos", drop = FALSE) +
  lims(y = c(0, 8)) +
  theme(
    panel.background = element_blank(),
    axis.line.x = element_line(colour = "grey50"),
    axis.line.y = element_line(colour = "grey50")
  ) +
  labs(
    x = "Número de filhos", 
    y = "Frequência absoluta",
    title = "Figura 2.4: Gráfico em barras para a variável Z: Número de filhos."
  )

# Plota o gráfico
plot(fig2_4)
