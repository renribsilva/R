###############################################################################
################################ Script Figura 3.18 ###########################
###############################################################################

# Cria um vetor com os dados
x <- c(15,5,3,8,10,2,7,11,12)

# Cria uma função para gerar um dataframe para a linha de suavização
scdf <- function(vetor){
  n <- length(vetor)
  f <- t <- table(vetor)
  st <- sum(t[1:n])
  for(i in 1:n) {
    f[i] <- sum(t[1:i])/st - (t[i]/st)/2
  }
  f <- f %>% as.data.frame()
  colnames(f) <- c("x", "Freq")  # Renomeia colunas corretamente
  f$x <- as.numeric(as.character(f$x))  # Converte os valores de x para numérico
  return(f)
}

# Gera o dataframe com a função
df <- scdf(x)
names(df)[2] <- "Freq"  # Renomeia a coluna da frequência

# Cria o gráfico
fig3_18 <- ggplot(data = data.frame(x = x)) +
  stat_ecdf(mapping = aes(x = x)) +
  scale_x_continuous(breaks = x) +
  scale_y_continuous(breaks = seq(0,1, by = 0.1),
                     labels = c("0/9","1/9","2/9","3/9","4/9","5/9","5/9","6/9","7/9","8/9","9/9")) +
  geom_point(data = df,
             mapping = aes(x = x, y = Freq)) +
  geom_line(data = df,
            mapping = aes(x = x, y = Freq),
            linetype = "dashed") +
  labs(y = "Distribuição empírica",
       title = "Funções de distribuição empírica (Fe) e ecdf alisada (Fe')") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "black"),
        axis.line.y = element_line(colour = "black"))

# Plota o gráfico
plot(fig3_18)

