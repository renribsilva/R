###############################################################################
############################## Script Figura 3.5 ##############################
###############################################################################

# Executa a base de dados da Tabela 2.1
source("PART_I/INPUT/INPUT_Tab_CD_Municípios.R")

# Cria a figura
fig3_5 <- ggplot(data.frame(x = c(0:100), y = c(0:100)), aes(x = x, y = y)) +
  geom_rect(mapping = aes(xmin = 25, xmax = 75, ymin = 75, ymax = 75),
            fill = NA,
            colour = "black") +
  annotate("segment", x = 25, y = 37.5, xend = 25, yend = 75) +
  annotate("segment", x = 75, y = 37.5, xend = 75, yend = 75) +
  geom_text(data = data.frame(x = c(50), y = c(80), l = c("n")),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(50, 20), 
                              y = c(70, 70), 
                              l = c(median(tab_CD_municípios$População, na.rm = T), "md")),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(20, 30, 70), 
                              y = c(55, 55, 55), 
                              l = c("q", 
                                    quantile(tab_CD_municípios$População, na.rm = T)[[2]],
                                    quantile(tab_CD_municípios$População, na.rm = T)[[4]])),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(20, 30, 70), 
                              y = c(45, 45, 45), 
                              l = c("E",
                                    quantile(tab_CD_municípios$População, na.rm = T)[[1]],
                                    quantile(tab_CD_municípios$População, na.rm = T)[[5]])),
            mapping = aes(x = x, y = y, label = l)) +
  geom_text(data = data.frame(x = c(50), 
                              y = c(90), 
                              l = c("Esquema dos cinco números")),
            mapping = aes(x = x, y = y, label = l)) +
  theme_void()

# Plota a figura
plot(fig3_5)
