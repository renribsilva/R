###############################################################################
############################## Script Figura 2.19 #############################
###############################################################################

# Revela-se extremamente trabalhoso construir um gráfico como o apresentdo
# no livro sem acesso aos dados desagrupados

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab_CM1.R")

# Cria um histograma com duas bases de dados
fig2_19 <- ggplot(df_CM1, aes(x = N_de_Empregados, y = Dens_fi)) +
  geom_bar(stat = "identity",
           fill = "gray50",
           colour = "gray50") +
  geom_text(data = tab_CM1,
            mapping = aes(x = c(5,15,25,35,50,70,90,120,160,220),
                          y = Dens_fi,
                          label = Prop,
                          vjust = -0.6)) +
  scale_x_continuous(breaks = c(0,10,20,30,40,60,80,100,140,180,260)) +
  lims(y = c(0,0.018)) +
  labs(y = "Densidade de frequência",
       x= "Número de empregados",
       title = "Histograma dos dados do CM1") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

# Plota o gráfico  
plot(fig2_19)
