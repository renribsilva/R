###############################################################################
############################## Script Tabela 2.3 ##############################
###############################################################################

# Monta uma tabela com dados que não estão em nenhuma base constante do livro
tab2_3 <- data.frame("Grau_de_Instrução" = c("ensino fundamental",
                                             "ensino médio",
                                             "ensino superior",
                                             "Total"),
                     "Freq_Abs" = c(650,1020,330,2000),
                     "Freq_Rel_Porc" = c(32.5,51,16.5,100))

str(tab2_3)