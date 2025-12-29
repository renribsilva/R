###############################################################################
############################# Script Exemplo 3.1 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Calcula a média desconsiderando valores não encontrados
print(mean(tab2_1$N_de_Filhos, na.rm = TRUE))

# Calcula a média aparada em 10%
print(mean(tab2_1$N_de_Filhos, na.rm = TRUE, trim = 0.1))


