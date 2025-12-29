###############################################################################
############################# Script Tabela 5.7 ###############################
###############################################################################

df5_7 <- data.frame(Espaço_amostral = c("BA",
                                        "BR",
                                        "MA",
                                        "MR",
                                        "FA",
                                        "FR"),
                    Probabilidades = c(0.2,
                                       0.05,
                                       0.25,
                                       0.25,
                                       0.05,
                                       0.2))

df5_7 <- df5_7 %>%
  rbind(list("Total", sum(df5_7$Probabilidades)))

print(kable(df5_7, caption = "Resultados e probabilidades para o Exemplo 5.15"))
