###############################################################################
############################# Script Figura 4.12 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria os gráficos
fig4_12 <- ggplot(tab2_1) +
  geom_point(mapping = aes(x = Anos, y = x_Sal_Min)) +
  labs(x = "Idade", y = "Salário (y salários mínimos)", 
       title = "Gráficos de dispersão das variáveis salário e idade, segundo a variável grau de instruçãol") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA)) +
  facet_grid(~Grau_de_Instrução)

# Plota o gráfico
plot(fig4_12)
