###############################################################################
############################# Script Figura 6.8 ###############################
###############################################################################

# Executa a base de dados
source("./PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_2_CONCEITO/Tab6_3.R")

# Cria o gráfico
fig6_8 <- ggplot(tab6_3, aes(y =`p(x)`, x = x)) +
  stat_ecdf() +
  labs(title = "Gráfico de p(x): distribuição da v.a. X = lucro por montagem",
       x = "Lucro por montagem",
       y = "Probabilidade de x = y") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))

plot(fig6_8)
