###############################################################################
############################# Script Figura 4.11 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Temperaturas.R")

# Cria o gráfico
fig4_11 <- ggplot(tab_CD_temperaturas, aes(x = Cananéia, y = Ubatuba)) +
  geom_abline(intercept = 0, slope = 1) +
  geom_point() +
  scale_y_continuous(breaks = round(unname(quantile(tab_CD_temperaturas$Ubatuba)), digits = 1)) +
  scale_x_continuous(breaks = round(unname(quantile(tab_CD_temperaturas$Cananéia)), digits = 1)) +
  labs(x = "Quantis de temperaturas em Cananéia (°C)",
       y = "Quantis de temperaturas em Ubatuba (°C)",
       title = "Gráfico q × q para os lados de temperatura de Cananeia e Ubatuba") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA),
        panel.grid = element_line(colour = "gray",
                                  linetype = "dashed"),
        panel.grid.minor = element_blank())

# Plota o gráfico
plot(fig4_11)
