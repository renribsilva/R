###############################################################################
############################## Script Testes 4.4 ##############################
###############################################################################

# Executa a função chisq_test
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/chisq_test.R")

# Executa a função chisq_coef
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/chisq_coef.R")

# Executa a função chisq_coef
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/chisq_plot.R")

# Executa a função chisq_coef
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/UNI/medida_simetria.R")

# Executa a função tabela_contingência
source("~/Área\ de\ trabalho/DEV/R/MY_FUNCTIONS/ESTATÍSTICA_BÁSICA/PART_I/BI/tabela_contingência.R")

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/4_4_MED_ASSOC_VAR_QUAL/Tab4_8.R")

############################ TESTES DO QUI-QUADRADO ###########################

c_testA <- chisq_test(df4_8,
                      vary = "estado",
                      varx = "tipo_de_cooperativa")

# Alternativa ao meu teste Chi-square
c_testB <- chisq.test(table(df4_8$estado, df4_8$tipo_de_cooperativa))

# Imprime o resultado
print(c_testA)
print(c_testB)

########################## COEFICIENTE DE CONTIGÊNCIA #########################

chisq_coef(df4_8, vary = "estado", varx = "tipo_de_cooperativa")

######################## DISTRIBUIÇÃO DO QUI-QUADRADO #########################

# Cria o gráfico de distribuição
gg <- chisq_plot(df4_8,
                 vary = "estado",
                 varx = "tipo_de_cooperativa",
                 type = "uni",
                 dir = "R",
                 alpha = 0.05)

# Plota o gráfico
plot(gg)

###################### SIMETRIA DA DIST DO QUI-QUADRADO #######################

# Cria a base de dados com os desvios ou qui-quadrados
dfqui <- data.frame(x = tabela_contingência(df4_8, 
                                    varx = "estado", 
                                    vary = "tipo_de_cooperativa",
                                    dist = "dev") %>% 
                        unlist())

# Calcula a simetria da distribuição do qui-quadrado
print(medida_simetria(dfqui, col = "x"))

