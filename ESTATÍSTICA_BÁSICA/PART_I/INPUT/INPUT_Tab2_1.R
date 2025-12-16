###############################################################################
############################## Script Tabela 2.1 ##############################
###############################################################################

# Imprime nomes das planilhas do dataset
excel_sheets("PART_I/DADOS/Dados_EB.xls")

# Importa a planilha "tabela 2.1.xls"
tab2_1 <- read_xls("PART_I/DADOS/Dados_EB.xls", 
                   sheet = 1,
                   skip = 1)

# Converte de tibble para data.frame
tab2_1 <- as.data.frame(tab2_1)

# Converte as variáveis qualitativas em fatores
tab2_1$`Estado Civil` <- factor(tab2_1$`Estado Civil`) %>%
  lvls_revalue(new_levels = c("Casado", 
                              "Solteiro"))
tab2_1$`Grau de Instrução` <- factor(tab2_1$`Grau de Instrução`) %>%
  lvls_revalue(new_levels = c("Ensino Fundamental", 
                              "Ensino Médio", 
                              "Ensino Superior"))
tab2_1$`Região de Procedência` <- factor(tab2_1$`Região de Procedência`) %>%
  lvls_revalue(new_levels = c("Capital",
                              "Interior",
                              "Outra região"))

# Padroniza os nomes das variáveis
names(tab2_1) <- c("N",
                   "Estado_Civil",
                   "Grau_de_Instrução",
                   "N_de_Filhos",
                   "x_Sal_Min",
                   "Anos",
                   "Meses",
                   "Região_de_Procedência")

str(tab2_1)
