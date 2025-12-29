###############################################################################
############################# Script Tabela 5.5 ###############################
###############################################################################

df5_5 <- data.frame(Espaço_amostral = c("BB","BV","VB","VV"),
                    Probabilidades = c(4/25,6/25,6/25,9/25))

df5_5 <- df5_5 %>%
  rbind(list("Total", sum(df5_5$Probabilidades)))

print(kable(df5_5, caption = "Resultados e probabilidades para o experimento do Exemplo 5.11"))
