###############################################################################
############################# Script Tabela 5.4 ###############################
###############################################################################

df5_4 <- data.frame(Espaço_amostral = c("BB","BV","VB","VV"),
                    Probabilidades = c(2/20,6/20,6/20,6/20))

df5_4 <- df5_4 %>%
  rbind(list("Total", sum(df5_4$Probabilidades)))

print(kable(df5_4, caption = "Resultados e probabilidades para o experimento do Exemplo 5.10"))
        