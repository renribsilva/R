###############################################################################
################################ Script Fig 3.11 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Cria o boxplot para a varíavel População
fig3_12 <- ggplot(tab_CD_municípios) +
  geom_boxplot(mapping = aes(x = 1, y = log(População)),) +
  geom_boxplot(mapping = aes(x = 2, y = População^(1/4))) +
  geom_boxplot(mapping = aes(x = 3, y = População^(1/2))) +
  geom_boxplot(mapping = aes(x = 4, y = População^(1/3))) +
  scale_x_continuous(breaks = seq(1,4, by = 1),
                     labels = c("ln(P)", 
                                expression(P^(1/4)), 
                                expression(P^(1/2)), 
                                expression(P^(1/3)))) +
  labs(x = "Variável População transformada",
       y = "",
       title = "Box plots para os dados transformados. CD-Municípios.") +
  theme(panel.background = element_blank(),
        axis.line.y = element_line(colour = "black"),
        axis.line.x = element_line(colour = "black"))

print(fig3_12)
  