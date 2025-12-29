###############################################################################
############################## Script Tabela 4.2 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/4_5_ASSOC_VAR_QUAN/Tab4_12.R")

# Cria o gráfico de dispersão
fig4_2 <- ggplot(df4_12, aes(x = X, y = Y)) +
  geom_point() +
  labs(x = "Anos de serviço",
       y = "Número de clientes",
       title = "Gráfico de dispersão para as variáveis X: anos de serviço e Y: número de clientes") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

# Plota o gráfico
plot(fig4_2)
  
