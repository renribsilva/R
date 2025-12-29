###############################################################################
############################## Script Figura 3.3 ##############################
###############################################################################

# Cria a figura
fig3_3 <- ggplot(data.frame(x = c(0:100), y = c(0:100)), aes(x = x, y = y)) +
  geom_rect(mapping = aes(xmin = 25, xmax = 75, ymin = 75, ymax = 75),
            fill = NA,
            colour = "black") +
  annotate("segment", x = 25, y = 37.5, xend = 25, yend = 75) +
  annotate("segment", x = 75, y = 37.5, xend = 75, yend = 75) +
  geom_text(data = data.frame(x = c(50), y = c(80), l = c("n")),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(50, 20), 
                              y = c(70, 70), 
                              l = c("q2", "md")),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(20, 30, 70), 
                              y = c(55, 55, 55), 
                              l = c("q", "q1", "q3")),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(20, 30, 70), 
                              y = c(45, 45, 45), 
                              l = c("E", "x(i)", "x(n)")),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(50), 
                              y = c(90), 
                              l = c("Esquema dos cinco números")),
            mapping = aes(x = x, y = y, label = l)) +
  theme_void()

# Plota a figura
plot(fig3_3)
