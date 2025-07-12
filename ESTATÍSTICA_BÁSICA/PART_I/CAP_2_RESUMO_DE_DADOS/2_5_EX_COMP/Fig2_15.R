###############################################################################
############################## Script Figura 2.15 #############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Poluição.R")

# Cria o gráfico
fig2_15 <- ggplot(tab_CD_poluição, aes(x = `Data`, y = `temp`)) +
  geom_line() +
  scale_x_date(date_breaks = "20 days",
               date_labels = "%d-%b") +
  theme(panel.background = element_rect(fill = "white", colour = "gray50"),
        panel.grid = element_blank()) +
  labs(x = "Dia do ano",
       y = "Temperatura (°C)",
       title = "Dados de temperatura de São Paulo no ano de 1991.")

# Plot o gráfico
plot(fig2_15)
