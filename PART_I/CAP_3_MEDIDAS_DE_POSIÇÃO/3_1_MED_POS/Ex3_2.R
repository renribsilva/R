###############################################################################
############################# Script Exemplo 3.2 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Executa o script da tabela 2.6
source("PART_I/CAP_2_RESUMO_DE_DADOS/2_3_GRÁFICOS/Fig2_6.R")

# Calcula a média da variável
m3_2 <-  round(mean(round(tab2_1$x_Sal_Min, digits = 0)), digits = 2)
print(m3_2)

# Extrai a moda de uma tabela de frequência da variável
mo3_2 <- data.frame(table(round(tab2_1$x_Sal_Min, digits = 0))[
  table(round(tab2_1$x_Sal_Min, digits = 0)) == 
    max(table(round(tab2_1$x_Sal_Min, digits = 0)))]) %>% 
  dplyr::rename("Moda(s)" = Var1, "Freq" = Freq)
print(mo3_2)

# Calcula a mediana da variável
me3_2 <- round(median(round(tab2_1$x_Sal_Min, digits = 0)), digits = 0)
print(me3_2)
