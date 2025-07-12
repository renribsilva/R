###############################################################################
############################## Script Figura 2.5 ##############################
###############################################################################

# Executa "Script Tabela 2.1" que contém a base de dados
source("PART_I/INPUT/INPUT_Tab2_1.R")

# Cria o gráfico a 
fig2_5_a <- ggplot(tab2_1, aes(x = N_de_Filhos)) + 
  geom_dotplot(stackratio = 0,
               dotsize = 1) +
  geom_text(mapping = aes(label = after_stat(count)), 
            stat = "count", 
            y = 1.1) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  labs(x = "Número de filhos")

# Cria o gráfico b
fig2_5_b <- ggplot(tab2_1, aes(x = N_de_Filhos)) + 
  geom_dotplot(dotsize = 1,
               stackratio = 1.5) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank()) +
  labs(x = "Número de filhos")

# Cria uma tabela para o gráfico c
df2_5 <- tab2_1$N_de_Filhos %>% table() %>% as_tibble() %>%
  rbind(data.frame(`.` = c(4), `n` = c(0))) %>% as.data.frame()

# Cria o gráfico c
fig2_5_c <- ggplot(df2_5, aes(x = `.`, y = `n`)) +
  geom_dotplot(binaxis = "y",
               dotsize = 1) +
  scale_x_discrete(drop = TRUE) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey50"),
        axis.line.y = element_line(colour = "grey50")) +
  lims(y = c(0.5,8)) +
  labs(x = "Número de filhos", 
       y = "Frequência absoluta")

# Plota os gráficos
print(
  plot_grid(fig2_5_a, fig2_5_b, fig2_5_c,
            labels = "auto",
            align = "h",
            nrow = 1,
            ncol = 3,
            scale = 0.9,
            label_x = 0.5)
)