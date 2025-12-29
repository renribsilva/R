###############################################################################
############################## Script Figura 2.9 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Plota o ramo-e-folhas
plot.new()
fig2_9 <- capture.output(stem(as.numeric(tab2_1$x_Sal_Min), scale = 2))
text(0,1, paste(fig2_9, collapse='\n'), adj=c(0,1), family='mono')

