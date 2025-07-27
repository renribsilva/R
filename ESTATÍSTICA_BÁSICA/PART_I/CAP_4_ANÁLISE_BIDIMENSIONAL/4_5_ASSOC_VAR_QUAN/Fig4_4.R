###############################################################################
############################## Script Tabela 4.4 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/4_5_ASSOC_VAR_QUAN/Tab4_13.R")

# Cria o gráfico de dispersão
fig4_4 <- ggplot(df4_13, aes(x = X, y = Y)) +
  geom_point() +
  labs(x = "Renda bruta (x salários mínimos)",
       y = "% gastos com saúde",
       title = "Renda bruta mensal (X) e porcentagem da renda gasta em saúde (Y) para um conjunto de famíliass") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

# Plota o gráfico
plot(fig4_4)

