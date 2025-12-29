###############################################################################
############################# Script Tabela 6.2 ###############################
###############################################################################

df6_2 <- data.frame(Espaço_amostral = c("BB","BL","BC",
                                        "LB","LL","LC",
                                        "CB","CL","CC"),
                    Probabilidade = c(0.56,0.16,0.08,
                                      0.07,0.02,0.01,
                                      0.07,0.02,0.01),
                    Lucro_montagem_X = c(15, 10,-5,
                                      10,5,-5,
                                      -5,-5,-5),
                    Custo_recuperação_Y = c(0,5,0,5,10,0,0,0,0))

print(kable(df6_2, caption = "Distribuição de probabilidade das possíveis composições das montagens"))
