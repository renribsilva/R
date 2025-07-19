###############################################################################
############################## Script Figura 3.4 ##############################
###############################################################################

# Determina uma semente para conjuntos de dados repetíveis
set.seed(1)

# Cria um dataframe com um conjunto de números gerados randomicamente
df3_4 <- data.frame(v = rnorm(100))

# Cria o boxplot para a conjunto de dados randômicos
fig3_4 <- ggplot(df3_4) +
  geom_boxplot(mapping = aes(y = v)) +
  scale_y_continuous(
    breaks = quantile(df3_4$v),
    labels = c("x(i)", "q1", "q2", "q3", "x(n)"),
    sec.axis = sec_axis(transform = "identity", breaks = quantile(df3_4$v))
  ) +
  scale_x_continuous(
    expand = expansion(mult = c(0.2,0.5)),
    sec.axis = sec_axis(transform = "identity")
  ) +
  annotate("segment", x = 0.75, xend = 0.75,
           y = quantile(df3_4$v)[[1]], yend = quantile(df3_4$v)[[2]],
           arrow = arrow(length = unit(0.05, "inches"), 
                         ends = "both", 
                         type = "closed")) +
  annotate("segment", x = 0.75, xend = 0.75,
           y = quantile(df3_4$v)[[2]], yend = quantile(df3_4$v)[[4]],
           arrow = arrow(length = unit(0.05, "inches"), 
                         ends = "both", 
                         type = "closed")) +
  annotate("segment", x = 0.75, xend = 0.75,
           y = quantile(df3_4$v)[[4]], yend = quantile(df3_4$v)[[5]],
           arrow = arrow(length = unit(0.05, "inches"), 
                         ends = "both", 
                         type = "closed")) +
  geom_text(data = data.frame(
    x = c(rep(0.9, 3)),
    y = c(
      quantile(df3_4$v)[[1]] + (quantile(df3_4$v)[[2]] - quantile(df3_4$v)[[1]])/2,
      quantile(df3_4$v)[[2]] + (quantile(df3_4$v)[[4]] - quantile(df3_4$v)[[2]])/2,
      quantile(df3_4$v)[[4]] + (quantile(df3_4$v)[[5]] - quantile(df3_4$v)[[4]])/2),
    l = c("3/2 dq", "dq", "3/2 dq")),
    mapping = aes(x = x, y = y, label = l)) +
  theme(
    panel.background = element_blank(),
    axis.line.x = element_line(colour = "black", linetype = "dashed"),
    axis.line.y = element_line(colour = "black"),
    axis.ticks.x = element_blank(),
    axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank()
  ) +
  labs(title = "Representação de um boxplot")

# Plota a figura
plot(fig3_4)
