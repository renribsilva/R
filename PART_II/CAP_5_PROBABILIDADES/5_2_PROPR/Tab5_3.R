###############################################################################
############################# Script Tabela 5.3 ###############################
###############################################################################

# Cria a base de dados
df5_3 <- data.frame("Homens_H" = c(70,15,10,20),
                    "Mulheres_M" = c(40,15,20,10),
                    row.names = c("Matemática_puta_M",
                                  "Matemática_aplicada_A",
                                  "Estatística_E",
                                  "Computação_C"))

df5_3 <- df5_3 %>% 
  cbind("Total" = apply(df5_3, MARGIN = 1, FUN = sum)) %>%
  rbind("Total" = c(as.vector(apply(df5_3, MARGIN = 2, FUN = sum)), sum(apply(df5_3, MARGIN = 2, FUN = sum))))

# Imprime a tabela
print(kable(df5_3, caption = "Distribuição de alunos segundo o sexo e escolha de curso"))


                                             