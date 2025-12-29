###############################################################################
############################## Script Figura 4.9 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig4_9 <- ggplot(tab2_1, aes(y = x_Sal_Min)) +
  geom_boxplot(mapping = aes(x = Região_de_Procedência)) +
  labs(x = "Região de procedência",
       y = " Salário (y salários mínimos)",
       title = "Box plots de salário segundo região de procedência") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

# Plota o gráfico
plot(fig4_9)
