###############################################################################
################################ Script Fig 3.17 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Poluição.R")

# Executa o script da função sim_uv
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/UNI/simetria_uv.R")

# Cria o dataframe com os valores ui e vi
df3_17 <- simetria_uv(tab_CD_poluição, col = "temp")

# Cria o gráfico de simetria ui vs. vi
fig3_17 <- ggplot(df3_17, aes(x = ui, y = vi)) +
  geom_point() +
  geom_abline() +
  labs(x = "ui",
       y = "vi",
       title = "Gráfico de simetria para o CD-Municípios.") +
  scale_y_continuous(expand = expansion(mult = c(0,0.05))) +
  scale_x_continuous(expand = expansion(mult = c(0,0.05))) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

plot(fig3_17)


