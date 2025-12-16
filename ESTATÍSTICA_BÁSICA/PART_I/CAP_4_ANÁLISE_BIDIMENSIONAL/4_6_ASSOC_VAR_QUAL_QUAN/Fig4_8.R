###############################################################################
############################## Script Figura 4.8 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico
fig4_8 <- ggplot(tab2_1, aes(y = x_Sal_Min)) +
  geom_boxplot(mapping = aes(x = Grau_de_Instrução)) +
  labs(x = "Grau de Instrução",
       y = " Salário (y salários mínimos)",
       title = "Box plots de salário segundo grau de instrução.") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

# Plota o gráfico
plot(fig4_8)
