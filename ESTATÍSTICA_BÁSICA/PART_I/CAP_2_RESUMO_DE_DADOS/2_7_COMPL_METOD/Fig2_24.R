###############################################################################
############################## Script Figura 2.24 #############################
###############################################################################

# Cria o dataframe com a base de dados
df2_24 <- data.frame("Compahia química" = c(1:20),
           "Produção(t)" = c(50, 280, 560, 170, 180, 500, 250, 200, 
                             1050, 240, 180, 1000, 1100, 120, 4200, 
                             5100, 480, 90, 870, 360))

#A interpretação do gráfico ramo-e-folhas revela-se a princípio bastante complexa
stem.leaf(df2_24$Produção.t.)
          