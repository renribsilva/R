###############################################################################
############################# Script Tabela 6.1 ###############################
###############################################################################

df6_1 <- data.frame(Fábrica_A_cilindros = c(0.8,0.1,0.1),
                    Fábrica_B_esfera = c(0.7,0.2,0.1),
                    row.names = c("Dentro das especificações (B)",
                                  "Maior que as especificações (L)",
                                  "Menor que as especificações (C)"))

df6_1 <- df6_1 %>%
  rbind("Total" = list(sum(df6_1[[1]]), sum(df6_1[[2]])))

print(kable(df6_1, caption = "Distribuição da produção das fábricas A e B, de acordo com as medidas das peças produzidas"))
