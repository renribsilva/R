###############################################################################
############################## Script Tabela 4.5 ##############################
###############################################################################

# Executa a função dist_conj
source("~/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/BI/dist_conj.R")

# Monta a base de dados
df4_5 <- data.frame(rbind(
  matrix(rep(c("Masculino","Economia"),times = 85), ncol = 2, byrow = T),
  matrix(rep(c("Feminino","Economia"),times = 35), ncol = 2, byrow = T),
  matrix(rep(c("Masculino","Administração"),times = 55), ncol = 2, byrow = T),
  matrix(rep(c("Feminino","Administração"),times = 25), ncol = 2, byrow = T)))

colnames(df4_5) <- c("sexo","curso")

# Monta a tabela de distribuição conjunta de alunos segundo o 
# sexo (X) e o curso escolhido (Y)
tab4_5 <- dist_conj(df4_5, 
                    varx = "sexo",
                    vary = "curso",
                    dist = "abs")

# Imprime o dataframe
print(tab4_5)
