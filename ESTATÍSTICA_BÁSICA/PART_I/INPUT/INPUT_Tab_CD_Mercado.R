###############################################################################
####################### Script Tabela CD_Mercado #########################
###############################################################################

# Imprime nomes das planilhas do dataset
excel_sheets("PART_I/DADOS/Dados_EB.xls")

# Importa a planilha "CD-notas.xls"
tab <- read_xls("PART_I/DADOS/Dados_EB.xls",
                sheet = 10,
                skip = 4,
                col_names = TRUE)

# Cria o data frame
tab <- tab %>% as.data.frame()

# Separa os blocos para posterior empilhamento
tab1 <- tab %>% dplyr::select(Mes...1, Dia...2, Telebrás...3, Indice...4)
tab2 <- tab %>% dplyr::select(Mes...5, Dia...6, Telebrás...7, Indice...8)
tab3 <- tab %>% dplyr::select(Mes...9, Dia...10, Telebrás...11, Indice...12)

# Dá nomes às tabelas parciais
names(tab1) <- names(tab2) <- names(tab3) <- c("Mês", "Dia", "Telebrás", "Ibovespa")

# Une as tabelas parciais em uma única estrtura
tab_CD_mercado <- rbind(tab1, tab2, tab3)

# Substitui NA por seus respectivos meses e converte para fator
tab_CD_mercado$Mês <- tab_CD_mercado$Mês %>% na.locf(na.rm = FALSE) %>%
  as.factor()

# Remove as linhas com NA
tab_CD_mercado <- tab_CD_mercado %>% na.omit()

# Acresce uma coluna com data
tab_CD_mercado <- tab_CD_mercado %>%
  mutate(Data= paste(tab_CD_mercado$Mês, tab_CD_mercado$Dia, c("1995"), sep = "-"))

# Formata data para as.Date
tab_CD_mercado$Data <- tab_CD_mercado$Data %>%
  base::as.Date(format = "%b-%d-%Y")

# Seleciona apenas as colunas de interesse
tab_CD_mercado <- tab_CD_mercado %>%
  dplyr::select(Telebrás, Ibovespa, Data)

str(tab_CD_mercado)
