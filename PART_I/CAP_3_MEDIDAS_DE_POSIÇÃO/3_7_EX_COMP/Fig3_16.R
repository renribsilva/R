###############################################################################
################################ Script Fig 3.16 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Poluição.R")

# Cria o gráfico
fig3_16 <- ggplot(tab_CD_poluição) +
  geom_boxplot(mapping = aes(y = temp)) +
  scale_x_continuous(expand = expansion(mult = c(0.3, 2))) +
  labs(x = "", y = "", title = "Box plot para as temperaturas de São Paulo. CD-Poluição.") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# Plota o gráfico
plot(fig3_16)
