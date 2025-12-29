###############################################################################
############################## Script Figura 2.13 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Notas.R")

# Cria um data frame para gerar o gráfico
df2_12 <- cut(tab_CD_notas$Notas, 
               breaks = seq(0,11, by = 0.5), 
               right = TRUE,
               labels = c(0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,
                          8,8.5,9,9.5,10,10.5)) %>% 
  as.data.frame()

# Dá nome à variável do data frame
names(df2_12) <- c("Classes_de_Notas")

# Cria o gráfico de dispersão unidimensional
fig2_13 <- ggplot(df2_12, aes(x = Classes_de_Notas)) +
  geom_dotplot(stackratio = 1.5,
               dotsize = 0.5) +
  scale_x_discrete(breaks = seq(0,11,by=1),
                   drop = FALSE,
                   expand = expansion(mult = c(0,0.05))) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  labs(x = "Classes de notas",
       title = "Gráfico de dispersão unidimensional para o CD-Notas. R.")

#Plota o gráfico
plot(fig2_13)
