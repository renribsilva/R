###############################################################################
############################## Script Tabela 2.2 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Monta vetor de frequências absolutas
tab2_2 <- table(tab2_1$Grau_de_Instrução) %>%
  as.data.frame() %>%
  dplyr::rename("Grau_de_Instrução" = `Var1`, "Freq_Abs" = `Freq`) %>%
  mutate(Freq_Rel = round((prop.table(Freq_Abs)), digits = 2),
         `Freq_Rel_Porc` = Freq_Rel*100)
  
# Insere linha de "Total"
tab2_2 <- tab2_2 %>% rbind(data.frame("Grau_de_Instrução" = c("Total"),
                                      "Freq_Abs" = c(sum(tab2_2$Freq_Abs)),
                                      "Freq_Rel" = c(sum(tab2_2$Freq_Rel)),
                                      "Freq_Rel_Porc" = c(sum(tab2_2$Freq_Rel_Porc))))

str(tab2_2)
