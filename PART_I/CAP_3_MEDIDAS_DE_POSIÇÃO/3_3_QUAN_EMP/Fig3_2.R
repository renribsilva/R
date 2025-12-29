###############################################################################
############################## Script Figura 3.2 ##############################
###############################################################################

# Cria um vetor com os dados do exemplo
df3_2 <- data.frame(v = c(15,5,3,8,10,2,7,11,12),
                    n = seq(1,9,1))

# Cria a figura
fig3_2 <- ggplot(df3_2, aes(x = v, y = n)) +
  geom_rect(mapping = aes(xmin = -1, xmax = 18, ymin = 3, ymax = 7),
            fill = NA,
            colour = "black") +
  annotate("segment", x = 1, y = 6, xend = 16, yend = 6) +
  annotate("segment", x = 1, y = 4, xend = 16, yend = 4) +
  geom_point(data = data.frame(x = quantile(df3_2$v), y = c(rep.int(6, times = 5))),
             mapping = aes(x = x, y = y)) +
  geom_text(data = data.frame(x = quantile(df3_2$v), 
                              y = c(rep.int(6.5, times = 5)),
                              l = c("x(i)", "q1", "q2", "q3", "x(n)")),
            mapping = aes(x = x, y = y, label = l)) +
  annotate("segment", 
           x = quantile(df3_2$v)[[1]], y = 4, 
           xend = quantile(df3_2$v)[[3]], yend = 4,
           arrow = grid::arrow(ends = "both", type = "closed", length = unit(0.05, "inches"))) +
  annotate("segment",
           x = quantile(df3_2$v)[[3]], y = 4,
           xend = quantile(df3_2$v)[[5]], yend = 4,
           arrow = grid::arrow(ends = "both",
                               type = "closed", 
                               length = unit(0.05, "inches"))) +
  geom_text(data = data.frame(x = c((quantile(df3_2$v)[[1]])+(quantile(df3_2$v)[[2]]-quantile(df3_2$v)[[1]])/2,
                                    (quantile(df3_2$v)[[2]])+(quantile(df3_2$v)[[3]]-quantile(df3_2$v)[[2]])/2,
                                    (quantile(df3_2$v)[[3]])+(quantile(df3_2$v)[[4]]-quantile(df3_2$v)[[3]])/2,
                                    (quantile(df3_2$v)[[4]])+(quantile(df3_2$v)[[5]]-quantile(df3_2$v)[[4]])/2),
                              ypos = rep.int(5.5, times = 4),
                              d = c((quantile(df3_2$v)[[2]])-(quantile(df3_2$v)[[1]]),
                                    (quantile(df3_2$v)[[3]])-(quantile(df3_2$v)[[2]]),
                                    (quantile(df3_2$v)[[4]])-(quantile(df3_2$v)[[3]]),
                                    (quantile(df3_2$v)[[5]])-(quantile(df3_2$v)[[4]]))),
            mapping = aes(x = x, y = ypos, label = d)) +
  geom_text(data = data.frame(x = c((quantile(df3_2$v)[[1]])+(quantile(df3_2$v)[[3]]-quantile(df3_2$v)[[1]])/2,
                                    (quantile(df3_2$v)[[3]])+(quantile(df3_2$v)[[5]]-quantile(df3_2$v)[[3]])/2),
                              ypos = rep.int(4.5, times = 2),
                              d = c((quantile(df3_2$v)[[3]])-(quantile(df3_2$v)[[1]]),
                                    (quantile(df3_2$v)[[5]])-(quantile(df3_2$v)[[3]]))),
            mapping = aes(x = x, y = ypos, label = d)) +
  geom_text(data = data.frame(x = c((quantile(df3_2$v)[[1]])+(quantile(df3_2$v)[[3]]-quantile(df3_2$v)[[1]])/2,
                                    (quantile(df3_2$v)[[3]])+(quantile(df3_2$v)[[5]]-quantile(df3_2$v)[[3]])/2),
                              ypos = rep.int(3.5, times = 2),
                              d = c("(di)", "(ds)")),
            mapping = aes(x = x, y = ypos, label = d)) +
  geom_text(data = data.frame(x = c(quantile(df3_2$v)[[3]]),
                              ypos = 8,
                              d = c("Quantis e distâncias dos dados")),
            mapping = aes(x = x, y = ypos, label = d)) +
  theme_void()

# Plota a figura
plot(fig3_2)
