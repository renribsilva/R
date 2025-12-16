###############################################################################
################################ Script Fig 3.10 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/CAP_3_MEDIDAS_DE_POSIÇÃO/3_5_GRA_SIMET/Ex3_9.R")

# Cria um dataframe
df3_10 <- data.frame(x = c3_9, y = rep(5, times = length(c3_9)))

# Cria a figura
fig3_10 <- ggplot(df3_10, aes(x = x, y = y)) +
  geom_rect(mapping = aes(xmin = -2, xmax = 18, ymin = 4.5, ymax = 5.4),
            fill = NA,
            colour = "black") +
  annotate("segment", x = -1, y = 5, xend = 17, yend = 5) +
  geom_text(data = data.frame(x = c(0,5,10,15), 
                              y = c(5.15,5.15,5.15,5.15)),
             mapping = aes(x = x, y = y, label = x)) +
  geom_point(data = data.frame(x = c(0:16), y = rep.int(5, times = 17)),
             mapping = aes(x = x, y = y),
             shape = 3) +
  geom_point(mapping = aes(x = x, y = y)) +
  geom_text(mapping = aes(x = x, y = y-0.3, label = x)) +
  geom_text(mapping = aes(x = x, 
                          y = y-0.1, 
                          label = c("x(1)", "x(2)", "x(3)", "x(4)", "x(5)", "x(9)", "x(8)", "x(7)", "x(6)")),
            size = 3) +
  scale_x_discrete(expand = expansion(mult = c(0.05,0.05))) +
  scale_y_discrete(expand = expansion(mult = c(0.6,0.6))) +
  geom_text(data = data.frame(t = c("Figura 3.10"), 
                              x = c(median(c3_9)), 
                              y = c(6)),
            mapping = aes(x = x, y = y, label = t)) +
  theme_void()

# Plota a figura
plot(fig3_10)
