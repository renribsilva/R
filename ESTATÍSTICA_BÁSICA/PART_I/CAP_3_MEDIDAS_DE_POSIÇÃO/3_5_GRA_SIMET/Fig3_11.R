###############################################################################
################################ Script Fig 3.11 ##############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Executa o script da função sim_uv
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/UNI/simetria_uv.R")

# Aplica a função e guarda em dfuv3_11
dfuv3_11 <- simetria_uv(tab_CD_municípios, col = "População")

# Cria o gráfico de simetria
fig3_11 <- ggplot(dfuv3_11, aes(x = ui, y = vi)) +
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
                
# Plota o gráfico
plot(fig3_11)
