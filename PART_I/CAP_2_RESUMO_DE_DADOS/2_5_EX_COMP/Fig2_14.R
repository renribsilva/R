###############################################################################
############################## Script Figura 2.14 #############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab_CD_Notas.R")

# Plota o ramo-e-folha
plot.new()
fig2_9 <- capture.output(stem(tab_CD_notas$Notas))
text(0,1, paste(fig2_9, collapse='\n'), adj=c(0,1), family='mono')
