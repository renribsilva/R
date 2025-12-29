###############################################################################
############################# Script Tabela 6.9 ###############################
###############################################################################

# Executa a base de dados
source("./PART_II/CAP_6_VARIÁVEIS_ALEATÓRIAS_DISCRETAS/6_2_CONCEITO/Tab6_3.R")

tab6_9 <- as.data.frame(tab6_3) %>%
  mutate("z=2x" = x*2, "z.p(x)" = `p(x)`*`z=2x`)

print(kable(tab6_9, caption = "Distribuição da variável aleatória Z = 2X"))
        