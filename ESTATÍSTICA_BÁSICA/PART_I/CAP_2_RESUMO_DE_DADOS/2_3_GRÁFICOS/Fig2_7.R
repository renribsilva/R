###############################################################################
############################## Script Figura 2.7 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig2_7 <- ggplot(tab2_1, aes(x = x_Sal_Min)) +
  geom_histogram(mapping = aes(y = ..density..),
                 breaks = seq(from = 3, to= 27, by=4),
                 colour = "white") +
  stat_bin(geom="text", 
           aes(label = paste(round((..count../sum(..count..))*100, digits = 0), "%"),
               y = ((..density..*0.5)/sin(0.52)),
               vjust = -0.8),
           breaks = seq(from = 3, to= 27, by=4)) +
  scale_x_continuous(breaks = seq(from = 3, to= 27, by=4),
                     expand = expansion(mult = c(0.1, 0.1))) +
  labs(x = "Classes de salário (x salários mínimos)",
       y = "Densidade de\nfrequência",
       title = "Histograma da variável S: salários.") +
  lims(y = c(0,0.1)) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50"),
        axis.title.y =  element_text(angle = 0))

# Plota o gráfico
plot(fig2_7)
