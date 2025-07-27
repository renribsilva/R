###############################################################################
############################## Script Tabela 4.8 ##############################
###############################################################################

# Executa a função dist_conj
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Cria a base de dados
df4_8 <- data.frame(rbind(
  matrix(rep(c("1.Consumidor","1.São Paulo"),times=214),ncol=2,byrow=T),
  matrix(rep(c("1.Consumidor","2.Paraná"),times=51),ncol=2,byrow=T),
  matrix(rep(c("1.Consumidor","3.Rio G. do Sul"),times=111),ncol=2,byrow=T),
  matrix(rep(c("2.Produtor","1.São Paulo"),times=237),ncol=2,byrow=T),
  matrix(rep(c("2.Produtor","2.Paraná"),times=102),ncol=2,byrow=T),
  matrix(rep(c("2.Produtor","3.Rio G. do Sul"),times=304),ncol=2,byrow=T),
  matrix(rep(c("3.Escola","1.São Paulo"),times=78),ncol=2,byrow=T),
  matrix(rep(c("3.Escola","2.Paraná"),times=126),ncol=2,byrow=T),
  matrix(rep(c("3.Escola","3.Rio G. do Sul"),times=139),ncol=2,byrow=T),
  matrix(rep(c("4.Outras","1.São Paulo"),times=119),ncol=2,byrow=T),
  matrix(rep(c("4.Outras","2.Paraná"),times=22),ncol=2,byrow=T),
  matrix(rep(c("4.Outras","3.Rio G. do Sul"),times=48),ncol=2,byrow=T)))

colnames(df4_8) <- c("tipo_de_cooperativa","estado")

# Monta a tabela de distribuição conjunta das frequências e proporções
# (em porcentagem), segundo o sexo (X) e o curso escolhido, margin == 2
tab4_8 <- tabela_contingência(df4_8,
                    vary = "estado",
                    varx = "tipo_de_cooperativa",
                    dist = "abs_rel",
                    margin = 1,
                    expected = F)

# Imprime o dataframe
print(tab4_8)
