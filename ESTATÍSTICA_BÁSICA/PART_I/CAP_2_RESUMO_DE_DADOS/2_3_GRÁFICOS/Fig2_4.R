###############################################################################
############################## Script Figura 2.4 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("~/R/ESTATÍSTICA_BÁSICA/AN_EX_DADOS/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig2_4 <- ggplot(tab2_1, aes(x = N_de_Filhos)) +
  geom_bar(stat = "count") +
  scale_x_discrete(name = "Número de filhos", limits = seq(0, 5, by = 1)) +
  geom_text(mapping = aes(label = ..count..), stat = "count", vjust = -0.5) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50")) +
  lims(y = c(0,8)) +
  labs(x = "Número de filhos", 
       y = "Frequência absoluta",
       title = "Figura 2.4: Gráfico em barras para a variável Z: Numero de filhos.")

# Plota o gráfico
plot(fig2_4)
