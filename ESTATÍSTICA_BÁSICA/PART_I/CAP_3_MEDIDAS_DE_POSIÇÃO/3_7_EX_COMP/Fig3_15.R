###############################################################################
############################### Script Figura 3.15 ############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Notas.R")

# Executa o script da função sim_uv
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/UNI/simetria_uv.R")

# Aplica a função e guarda em dfuv3_11
dfuv3_15 <- simetria_uv(tab_CD_notas, col = "Notas")

# Cria o gráfico de simetria
fig3_15 <- ggplot(dfuv3_15, aes(x = ui, y = vi)) +
  # Os pontos têm transparência 1/5
  geom_point(colour = alpha("black", 1/5)) +
  geom_abline() +
  labs(x = "ui",
       y = "vi",
       title = "Gráfico de simetria para o CD-Municípios.") +
  scale_y_continuous(breaks = seq(0,4, by = 1),
                     expand = expansion(mult = c(0,0.05))) +
  scale_x_continuous(expand = expansion(mult = c(0,0.05))) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

# Plota o gráfico
plot(fig3_15)

