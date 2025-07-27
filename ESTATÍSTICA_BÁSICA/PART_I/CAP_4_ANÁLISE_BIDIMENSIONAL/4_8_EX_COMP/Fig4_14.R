###############################################################################
############################# Script Exemplo 4.14 #############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Veículos.R")

# Cria o gráfico
fig4_14 <- ggplot(tab_CD_veículos, aes(x = Comprimento, y = Preço)) + 
  geom_point(mapping = aes(shape = NI, colour = NI), 
             size = 2) +
  scale_colour_manual(values = c("skyblue", "orange")) + 
  scale_shape_manual(values = c(19, 17), 
                     name = "Procedência",  
                     labels = c("Importado", "Nacional"), 
                     guide = guide_legend(override.aes = list(colour = c("skyblue", "orange")))) +
  guides(colour = "none") +
  labs(title = "Gráfico de dispersão simbólico das variáveis preço e comprimento de veículos, categorizadas pela variável procedência") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill = NA),
        panel.grid = element_line(colour = "gray95"),
        panel.grid.minor = element_blank())
  
# Plota o gráfico
plot(fig4_14)
