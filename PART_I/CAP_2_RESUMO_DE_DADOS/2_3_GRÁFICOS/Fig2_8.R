###############################################################################
############################## Script Figura 2.8 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria uma tabela com as informações que serão plotadas no gráfico
df2_8 <- tab2_1$N_de_Filhos %>%
  table(dnn = "Número_de_filhos") %>%
  as_tibble() %>%
  rbind(data.frame(`Número_de_filhos`= c(4L), `n`= c(0))) %>%
  as.data.frame() %>%
  mutate(`Freq_Rel` = round((`n`/sum(`n`)), digits = 2),
         `Porc` = paste((`Freq_Rel`*100), "%"),
         `Dens_Freq` = round((`Freq_Rel`/4), digits = 2))
  

# Cria o gráfico em barras
fig2_8 <- ggplot(df2_8, aes(x = `Número_de_filhos`, y = `Dens_Freq`)) +
  geom_bar(stat = "identity",
           width = 1,
           colour = "white") +
  scale_x_discrete(expand = expansion(mult = c(0.2, 0.2))) +
  geom_text(mapping = aes(label = `Porc`), 
            stat = "identity",
            vjust = -0.6) +
  labs(x = "Número de filhos",
       y = "Densidade de\nfrequência",
       title = "Histograma da variável Z: número de filhos") +
  lims(y = c(0,0.1)) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50"),
        axis.title.y =  element_text(angle = 0))

# Plota o gráfico
plot(fig2_8)
