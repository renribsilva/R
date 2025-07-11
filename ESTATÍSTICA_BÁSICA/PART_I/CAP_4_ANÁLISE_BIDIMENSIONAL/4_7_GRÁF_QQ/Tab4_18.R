###############################################################################
############################# Script Tabela 4.18 ##############################
###############################################################################

# Cria a base de dados
df4_18 <- data.frame(aluno=1:20,
                     prova1=c(8.5,3.5,7.2,5.5,9.5,7,4.8,6.6,2.5,7,7.4,5.6,6.3,3,8.1,3.8,6.8,10,4.5,5.9),
                     prova2=c(8,2.8,6.5,6.2,9,7.5,5.2,7.2,4,6.8,6.5,5,6.5,3,9,4,5.5,10,5.5,5))

# Imprime a tabela
print(kable(df4_18, caption = "Notas de 20 alunos em duas provas de Estatística"))

