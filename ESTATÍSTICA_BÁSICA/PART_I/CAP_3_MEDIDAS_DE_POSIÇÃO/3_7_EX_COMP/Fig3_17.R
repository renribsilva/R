###############################################################################
################################ Script Fig 3.17 ##############################
###############################################################################

# Executa a base de dados
source("~/R/ESTATÍSTICA_BÁSICA/AN_EX_DADOS/INPUT/INPUT_Tab_CD_Poluição.R")

# Executa o script da função sim_uv
source("~/R/MY_FUNCTION/ESTATÍSTICA_BÁSICA/sim_uv.R")

# Cria o dataframe com os valores ui e vi
df3_17 <- sim_uv(tab_CD_poluição, col = "temp")

# Cria o gráfico de simetria ui vs. vi
fig3_17 <- ggplot(df3_17, aes(x = ui, y = vi)) +
  geom_point() +
  geom_abline() +
  labs(x = "ui",
       y = "vi",
       title = "Gráfico de simetria para o CD-Municípios.") +
  scale_y_continuous(expand = expansion(mult = c(0.15,0.1))) +
  scale_x_continuous(expand = expansion(mult = c(0.2,0.2))) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

plot(fig3_17)


