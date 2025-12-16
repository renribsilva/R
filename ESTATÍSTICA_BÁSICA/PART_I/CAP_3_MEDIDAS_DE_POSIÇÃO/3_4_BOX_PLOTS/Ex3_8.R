###############################################################################
############################## Script Exemplo 3.8 ##############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Ordena decrescentemente os municípios mais populosos 
c3_7 <- tab_CD_municípios$População %>% 
  purrr::discard(is.na) %>%
  sort(decreasing = TRUE)

# Medidas resumo para a base de dados dos 15 municípios mais populosos (n=15)
print(summary(c3_7[1:15]))
