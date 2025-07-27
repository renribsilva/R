###############################################################################
############################# Script Figura 6.15 ##############################
###############################################################################

# Executa o script p_quantil
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_II/quantil_teórico.R")

# Cria a base de dados
df6_14 <- data.frame(x = c(1,0,1,-1))

# Calcula p_quantil mediana
quantil_teórico(df6_14, "x")

# Cria o gráfico
fig6_15 <- ggplot(df6_14, aes(x = x)) +
  stat_ecdf() +
  scale_x_continuous(breaks = c(-1,0,1),
                     expand = expansion(mult = c(0.1,0.1))) +
  scale_y_continuous(breaks = c(1/4,1/2,1),
                     labels = c("1/4","1/2", "1"),
                     expand = expansion(mult = c(0.2,0.2))) +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA)) +
  labs(title = "f.d.a. da v.a. X")

# Plota o gráfico
plot(fig6_15)

