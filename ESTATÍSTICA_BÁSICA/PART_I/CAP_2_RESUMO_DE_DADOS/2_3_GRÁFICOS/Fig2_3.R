###############################################################################
############################## Script Figura 2.3 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria uma tabela com as coordenadas dos rótulos, bem como os próprios rótulos
coord2_2 <- tab2_1$Grau_de_Instrução %>% 
  table(dnn = "Grau_de_Instrução") %>% 
  as.data.frame() %>% 
  dplyr::rename("Grau de Instrução" = "Grau_de_Instrução") %>%
  mutate(Freq_Rel = prop.table(Freq)*100,
         Ypos = (100-cumsum(Freq_Rel))+(Freq_Rel/2),
         Lab = paste(Freq, " (", round(Freq_Rel, digits = 0), "%)", sep = ""))
  
# Cria o gráfico
fig2_3 <- ggplot(coord2_2, aes(x = "", y = `Freq_Rel`)) +
  geom_bar(mapping = aes(fill = `Grau de Instrução`), 
           stat = "identity", 
           colour = "white") +
  scale_fill_brewer(palette = "Set2") +
  theme_void() +
  geom_text(aes(x = "", y = `Ypos`, label = `Lab`), 
            color = "white",
            size = 3) +
  coord_polar(theta = "y", 
              start = 0) +
  labs(title = "Gráfico em setores para a variável Y: grau de instrução.")

# Plota o gráfico
plot(fig2_3)
