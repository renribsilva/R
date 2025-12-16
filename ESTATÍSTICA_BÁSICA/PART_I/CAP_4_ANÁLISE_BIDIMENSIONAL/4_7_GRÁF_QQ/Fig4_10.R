###############################################################################
############################# Script Figura 4.10 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/4_7_GRÁF_QQ/Tab4_18.R")

# Cria o gráfico
fig4_10 <- ggplot(df4_18, aes(x = prova1, y = prova2)) +
  geom_abline(intercept = 0, slope = 1) +
  geom_point() +
  scale_y_continuous(breaks = unname(quantile(df4_18$prova2))) +
  scale_x_continuous(breaks = unname(quantile(df4_18$prova1))) +
  labs(x = "Quantis da prova 1",
       y = "Quantis da prova 2",
       title = "Gráfico q × q para as notas em duas provas de Estatística") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA),
        panel.grid = element_line(colour = "gray",
                                  linetype = "dashed"),
        panel.grid.minor = element_blank())

# Plota o gráfico
plot(fig4_10)
