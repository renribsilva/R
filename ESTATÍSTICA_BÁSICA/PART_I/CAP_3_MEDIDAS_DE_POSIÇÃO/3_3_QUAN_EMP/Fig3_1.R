###############################################################################
############################## Script Figura 3.1 ##############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Determina uma semente para conjuntos de dados repetíveis
set.seed(1)

# Gera um data frame com valores randômicos
df3_1 <- data.frame(x = rnorm(1000, mean = 0, sd = 1))

# Cria um gráfico com a distribuição normal dos valores
fig3_1 <- ggplot(df3_1, aes(x = x)) +
  stat_function(aes(fill = "2º a 4º quartil"),
                fun = dnorm, 
                geom = "area",
                alpha = 0.5,
                xlim=c(quantile(df3_1$x)[2], quantile(df3_1$x)[4])) +
  stat_function(fun = dnorm) +
  guides(fill = guide_legend(title = "Obervações")) +
  scale_fill_discrete(type = c("skyblue")) +
  scale_x_continuous(breaks = c(quantile(df3_1$x)),
                     labels = c("x(1)", "q1", "q2", "q3", "x(n)"),
                     expand = expansion(mult = c(0.1, 0.1))) +
  scale_y_continuous(expand = expansion(mult = c(0,0.4))) +
  geom_text(data = data.frame(x = 0, y = 0.2),
            mapping = aes(x = x, y = y, label = "50% das\nobservações"),
            size = 3)+
  theme(panel.background = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.ticks.y = element_blank()) +
  labs(x = "",
       title = "Distribuição gaussiana")
# Plota o gráfico
plot(fig3_1)
