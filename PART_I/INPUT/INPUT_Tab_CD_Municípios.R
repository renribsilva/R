###############################################################################
######################## Script Tabela CD_Municípios ##########################
###############################################################################

# Imprime nomes das planilhas do dataset
excel_sheets("PART_I/DADOS/Dados_EB.xls")

# Importa a planilha "CD-notas.xls"
tab_CD_municípios <- read_xls("PART_I/DADOS/Dados_EB.xls",
                         sheet = 3,
                         skip = 4,
                         col_names = TRUE)

# Cria o data frame
tab_CD_municípios <- tab_CD_municípios %>% 
  as.data.frame() %>% dplyr::arrange(População)

# Remove a última linha com valores não encontrados
tab_CD_municípios <- tab_CD_municípios[1:30,]
