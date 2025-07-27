###############################################################################
####################### Script Tabela CD_Temperaturas #########################
###############################################################################

# Imprime nomes das planilhas do dataset
excel_sheets("PART_I/DADOS/Dados_EB.xls")

# Importa a planilha "CD-notas.xls"
tab <- read_xls("PART_I/DADOS/Dados_EB.xls",
                              sheet = 6,
                              skip = 4,
                              col_names = TRUE)

# Cria o data frame
tab <- tab %>% as.data.frame()
tab1 <- tab %>% dplyr::select(Ano...1, Cananéia...2, Ubatuba...3)
tab2 <- tab %>% dplyr::select(Ano...4, Cananéia...5, Ubatuba...6)
names(tab1) <- names(tab2) <- c("Ano","Cananéia","Ubatuba")

tab_CD_temperaturas <- rbind(tab1, tab2)
tab_CD_temperaturas$Ano <- tab_CD_temperaturas$Ano %>% na.locf(na.rm = FALSE) %>%
  as.factor()
