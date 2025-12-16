###############################################################################
############################## Script Figura 3.8 ##############################
###############################################################################

# Determinando uma sementes para conjuntos de dados repetíveis
set.seed(1)

# Gera um data frame com valores randômicos
df3_1 <- data.frame(x = rnorm(1000, mean = 0, sd = 1))

# Calcula os limites inferior e superior
LS <-  quantile(df3_1$x)[[4]] + 1.5*(quantile(df3_1$x)[[4]]-quantile(df3_1$x)[[2]])
LI <-  quantile(df3_1$x)[[2]] - 1.5*(quantile(df3_1$x)[[4]]-quantile(df3_1$x)[[2]])

# Cria um gráfico com a distribuição normal dos valores
fig3_8 <- ggplot(df3_1, aes(x = x)) +
  stat_function(aes(fill = "Valores adjacentes"),
                fun = dnorm, 
                geom = "area",
                alpha = 0.5,
                xlim=c(LI, LS)) +
  guides(fill = guide_legend(title = "Obervações")) +
  scale_fill_discrete(type = c("skyblue")) +
  scale_x_continuous(breaks = c(quantile(df3_1$x)),
                     labels = c("x(1)", "q1", "0", "q3", "x(n)"),
                     expand = expansion(mult = c(0.1, 0.1))) +
  geom_text(data = data.frame(x = 0, y = 0.2),
            mapping = aes(x = x, y = y, label = "99,3% das\nobservações"),
            size = 3)+
  theme(panel.background = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.ticks.y = element_blank()) +
  labs(x = "",
       title = "Distribuição gaussiana")

# Plota o gráfico
plot(fig3_8)
