###############################################################################
############################# Script Tabela 6.5 ###############################
###############################################################################

df6_5 <- data.frame(Espaço_amostral = c("BB","BV","VB","VV"),
                    Probabilidade = c(1/10,3/10,3/10,3/10),
                    X = c(0,1,1,2))

print(kable(df6_5, caption = "Distribuição de probabilidade das possíveis composições das montagens"))
