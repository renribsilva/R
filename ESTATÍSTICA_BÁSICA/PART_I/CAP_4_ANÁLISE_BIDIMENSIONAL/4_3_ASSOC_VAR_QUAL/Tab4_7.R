###############################################################################
############################## Script Tabela 4.7 ##############################
###############################################################################

# Executa a função dist_conj
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Monta a base de dados
df4_7 <- data.frame(rbind(
  matrix(rep(c("Masculino","Física"), times = 100), ncol = 2, byrow = T),
  matrix(rep(c("Feminino","Física"), times = 20), ncol = 2, byrow = T),
  matrix(rep(c("Masculino","Ciências Sociais"), times = 40), ncol = 2, byrow = T),
  matrix(rep(c("Feminino","Ciências Sociais"), times = 40), ncol = 2, byrow = T)))

# Dá nome às colunas
colnames(df4_7) <-c ("sexo","curso")

# Monta a tabela de distribuição conjunta das frequências e proporções
# (em porcentagem), segundo o sexo (X) e o curso escolhido, margin == 2
tab4_7 <- tabela_contingência(df4_7,
                    vary = "curso",
                    varx = "sexo",
                    dist = "abs_rel",
                    margin = 2,
                    expected = F)

# Imprime o dataframe
print(tab4_7)
