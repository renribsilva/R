###############################################################################
############################# Script Tabela 6.7 ###############################
###############################################################################

df6_7 <- data.frame(Espaço_amostral = c("CC","CR","RC","RR"),
                    Probabilidade = c(1/4,1/4,1/4,1/4),
                    Y = c(2,1,1,0))

print(kable(df6_7, caption = "Distribuição de probabilidade das possíveis composições das montagens"))

