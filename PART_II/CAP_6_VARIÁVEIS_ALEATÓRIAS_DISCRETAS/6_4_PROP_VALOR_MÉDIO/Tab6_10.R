###############################################################################
############################# Script Tabela 6.10 ##############################
###############################################################################

# Executa a base de dados
source("./PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_2_CONCEITO/Tab6_3.R")

tab6_10 <- as.data.frame(tab6_3) %>%
  mutate("w=x^2" = x^2, "w.p(x)" = `p(x)`*`w=x^2`)

print(kable(tab6_10, caption = "Distribuição da variável aleatória Z = X^2"))
