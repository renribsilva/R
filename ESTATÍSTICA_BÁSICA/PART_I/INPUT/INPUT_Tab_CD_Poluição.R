###############################################################################
########################## Script Tabela CD-Poluicao ##########################
###############################################################################

# Imprime nomes das planilhas do dataset
excel_sheets("PART_I/DADOS/Dados_EB.xls")

# Importa a planilha "CD-notas.xls"
tab_CD_poluição <- read_xls("PART_I/DADOS/Dados_EB.xls", 
                         sheet = 5,
                         skip = 8,
                         col_names = TRUE)

tab_CD_poluição$Data <- paste(tab_CD_poluição$Data, "-1991")
tab_CD_poluição$Data <- gsub(" ","",tab_CD_poluição$Data)
tab_CD_poluição$Data <- gsub(",","-",tab_CD_poluição$Data)
tab_CD_poluição$Data <- tab_CD_poluição$Data %>% as.Date(format = "%b-%d-%Y")

str(tab_CD_poluição)

