###############################################################################
############################# Script Figura 4.13 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Mercado.R")

# Calcula a reta de mínimos quadrados
modelo <- lm(tab_CD_mercado$Ibovespa[1:39] ~ tab_CD_mercado$Telebrás[1:39])
intercept <- coef(modelo)[1]
slope <- coef(modelo)[2]

# Cria o gráfico
fig4_13 <- ggplot(dplyr::filter(tab_CD_mercado, Data <= as.Date("1995-02-24")),
       mapping = aes(x = Telebrás, y = Ibovespa)) +
  geom_abline(intercept = intercept, slope = slope)+
  geom_point() +
  labs(title = "Gráfico de dispersão para ações da Telebrás e BOVESPA.") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

# Plota o gráfico
plot(fig4_13)

