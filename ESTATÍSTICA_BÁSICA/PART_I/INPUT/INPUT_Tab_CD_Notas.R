###############################################################################
########################## Script Tabela CD_Notas #############################
###############################################################################

# Imprime nomes das planilhas do dataset
excel_sheets("PART_I/DADOS/Dados_EB.xls")

# Importa a planilha "CD-notas.xls"
tab_CD_notas <- read_xls("PART_I/DADOS/Dados_EB.xls",
                         sheet = 4,
                         skip = 3,
                         col_names = FALSE)

tab_CD_notas <- tab_CD_notas %>% tibble() %>% unlist() %>% data.frame() 
row.names(tab_CD_notas) <- c(NULL)
names(tab_CD_notas) <- c("Notas")

str(tab_CD_notas)
