###############################################################################
############################# Script Figura 6.12 ###############################
###############################################################################

# Cria a base de dados
source("./PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_6_MOD_PROB/Tab6_12.R")

# Cria o gráfico
fig6_12 <- ggplot(df6_12, aes(y = px, x = x)) +
  geom_point() +
  labs(title = "Probabilidades binomiais para n = 3 e P(S) = p",
       x = "Número de sucessos",
       y = "P(S) = p") +
  scale_y_continuous(expand = expansion(mult = c(0.2,0.2)),
                     breaks = c(1/8,2/8,3/8),
                     labels = c("1/8","2/8","3/8")) +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

plot(fig6_12)
