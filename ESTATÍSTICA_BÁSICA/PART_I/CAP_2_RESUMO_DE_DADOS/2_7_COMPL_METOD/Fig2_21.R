###############################################################################
############################# Script Figura 2.20B #############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

#Cria o gráfico
fig2_21 <- ggplot(tab2_1, aes(x = x_Sal_Min)) +
  geom_line(mapping = aes(y = cumsum(x_Sal_Min/sum(x_Sal_Min)*100)),
            linewidth = 1.05) +
  labs(y = "%",
       x = "Salários",
       title = "Porcentagens acumuladas para Salários") +
  scale_y_continuous(breaks = seq(0,100, by = 20),
                     labels = seq(0,100, by = 20),
                     limits = c(0,120)) +
  scale_x_continuous(breaks = seq(0,24, by = 4),
                     labels = seq(0,24, by = 4)) +
  theme(panel.background = element_blank(),
        axis.title.y = element_text(angle = 0),
        axis.line = element_line(colour = "black")) +
  geom_segment(x = 12.79, y = 0, xend = 12.79, yend = 50, linetype = "dashed") +
  geom_segment(x = 0, y = 50, xend = 12.79, yend = 50, linetype = "dashed") +
  geom_segment(x = 0, y = 100, xend = 24, yend = 100, linetype = "dashed")

# Plota o gráfico
plot(fig2_21)
