###############################################################################
############################# Script Tabela 5.6 ###############################
###############################################################################

df5_6 <- data.frame(Espaço_amostral = c("BBV",
                                        "BVB",
                                        "BVV",
                                        "VBB",
                                        "VBV",
                                        "VVB",
                                        "VVV"),
                    Probabilidades = c(6/60,
                                       6/60,
                                       12/60,
                                       6/60,
                                       12/60,
                                       12/60,
                                       6/60))

df5_6 <- df5_6 %>%
  rbind(list("Total", sum(df5_6$Probabilidades)))

print(kable(df5_6, caption = "Resultados e probabilidades para o experimento do Exemplo 5.12"))
