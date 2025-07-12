###############################################################################
############################## Script Figura 2.6 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Aproxima a variável contínua por uma variável discreta
df2_6 <- cut(tab2_1$x_Sal_Min, 
                  breaks = seq(2,30,by=4),
                  right=TRUE, 
                  labels = c(4,8,12,16,20,24,30)) %>% as.data.frame()

# Cria o gráfico
fig2_6 <- ggplot(df2_6, aes(x = `.`)) +
  geom_bar() +
  geom_text(mapping = aes(label = after_stat(count)), stat = "count", vjust = -0.5) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50")) +
  lims(y = c(0,15)) +
  labs(x = "Ponto médio das classes de salário (x salários mínimos)", 
       y = "Frequência absoluta",
       title = "Gráfico em barras para a variável S: salários.")

# Plota o gráfico
plot(fig2_6)

