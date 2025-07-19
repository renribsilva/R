###############################################################################
############################## Script Figura 3.7 ##############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Cria o boxplot para a varíavel População
fig3_7 <- ggplot(tab_CD_municípios) +
  geom_boxplot(mapping = aes(y = População)) +
  # É possível transformar a escala a fim de que os dados sejam melhor visualizados
  # scale_y_continuous(trans = "log2") +
                     # breaks = trans_breaks("log2", function(x) {2^x}, n.breaks = 5 ),
                     # labels = trans_format("log2", math_format(2^.x, format = function(x) round(x)))) +
  scale_x_continuous(expand = expansion(c(0.3,4))) +
  labs(y = (bquote(População (Log[10]), splice = FALSE))) +
  theme(panel.background = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.line.y = element_line(colour = "black"))

plot(fig3_7)