###############################################################################
############################### Script Figura 3.14 ############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Notas.R")

# Cria o gráfico
fig3_14 <- ggplot(tab_CD_notas) +
  geom_boxplot(mapping = aes(y = Notas)) +
  scale_x_continuous(expand = expansion(mult = c(0.5,1))) +
  theme(panel.background = element_blank(),
        panel.border = element_rect(color = "black", fill = NA),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  ggtitle("Box plot para o CD-Notas.")

print(fig3_14)
