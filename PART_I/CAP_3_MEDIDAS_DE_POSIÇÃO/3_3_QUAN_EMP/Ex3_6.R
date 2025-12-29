###############################################################################
############################# Script Exemplo 3.6 ##############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Executa a base de dados do Exemplo 3.5
source("PART_I/CAP_3_MEDIDAS_DE_POSIÇÃO/3_3_QUAN_EMP/Ex3_5.R")

# Calcula as posições do polígono
pos_pq <- data.frame("id" = c(1, 1, 1, 1, 2, 2, 2, 2),
                     "x" = c(4,4,8,8,8,8, median(tab2_1$x_Sal_Min), median(tab2_1$x_Sal_Min)),
                     "y" = c(0,0.069,0.069,0,0,0.0897,0.0897,0))

# Cria o gráfico evidenciando
Ex3_6 <- ggplot(tab2_1, aes(x = x_Sal_Min)) +
  geom_polygon(data = pos_pq,
               mapping = aes(x = x, y = y, fill = "1º a 50º percentil"),
               alpha = 0.8) +
  geom_histogram(mapping = aes(y = ..density..),
                 breaks = seq(from = 4, to= 24, by=4),
                 colour = "black",
                 fill = NA) +
  stat_bin(geom="text", 
           aes(label = paste(round((..count../sum(..count..))*100, digits = 0), "%"),
               y = ..density..,
               vjust = -0.8),
           breaks = seq(from = 4, to= 24, by=4)) +
  scale_x_continuous(breaks = round(c(4, median(tab2_1$x_Sal_Min), 24),digits = 1),
                     expand = expansion(mult = c(0.1, 0.1))) +
  labs(x = "Salário (x salários mínimos)",
       y = "Densidade de\nfrequência",
       title = "Histograma da variável: salários.") +
  lims(y = c(0,0.1)) +
  theme(panel.background = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.line.x.top = element_line(colour = "black"),
        axis.line.x.bottom = element_line(colour = "black")) +
  guides(fill = guide_legend(title = "Quantis empíricos")) +
  scale_fill_discrete(type = c("skyblue"))

# Plota o gráfico
plot(Ex3_6)

# Calcula a mediana da variável
median(tab2_1$x_Sal_Min)

# Calcula os quantis empíricos de p diversos
quantile(tab2_1$x_Sal_Min, probs = c(.20,.5,.95,.75))

# Calcula os quantis empíricos de p em quartis
q <- quantile(tab2_1$x_Sal_Min,probs=c(.25,.5,.75))

# Calcula a distância interquartil q3-q1
dq=q[3]-q[1]
print(paste("Distância inter-quartis (d) = ", dq))
