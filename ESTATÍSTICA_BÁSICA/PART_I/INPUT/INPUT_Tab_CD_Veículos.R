###############################################################################
########################## Script Tabela CD_Veículos ##########################
###############################################################################

# Imprime nomes das planilhas do dataset
excel_sheets("PART_I/DADOS/Dados_EB.xls")

# Importa a planilha "CD-notas.xls"
tab_CD_veículos <- read_xls("PART_I/DADOS/Dados_EB.xls",
                sheet = 8,
                skip = 4,
                col_names = TRUE)

# Cria o data frame
tab_CD_veículos <- tab_CD_veículos %>% as.data.frame()
names(tab_CD_veículos)[5] <- c("NI")
tab_CD_veículos$NI <- tab_CD_veículos$NI %>% as.factor()

str(tab_CD_veículos)
