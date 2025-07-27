###############################################################################
############################# Script Tabela 6.13 ##############################
###############################################################################

source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/STANDARD_TABLES/Poisson_table.R")

tab6_13 <- Poisson_table(0:10, lambda = 3.87) %>%
  as.data.frame() %>%
  cbind("n" = c(57,203,383,525,532,408,273,139,45,27,16)) %>%
  mutate("n.p" = sum(57,203,383,525,532,408,273,139,45,27,16)*`3.87`)


print(kable(tab6_13, caption = "Distribuição da produção das fábricas A e B, de acordo com as medidas das peças produzidas"))
