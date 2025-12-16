###############################################################################
############################## Script Tabela 4.5 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/4_5_ASSOC_VAR_QUAN/Tab4_14.R")

# Cria o gráfico de dispersão
fig4_5 <- ggplot(df4_14, aes(x = X, y = Y)) +
  geom_point() +
  labs(x = "Resultado do teste",
       y = "Tempo",
       title = "Gráfico de dispersão para as variáveis X: resultado no teste e Y: tempo de operação.") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

# Plota o gráfico
plot(fig4_5)
