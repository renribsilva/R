# ------------------------------------------------
# Importando as bibliotecas que serão utilizadas -
# ------------------------------------------------

library(tidyverse) # pacote utilizado para manipulação de bases de dados
library(data.table) # pacote utilizado para leitura da base de dados do Enem
library(car) # pacote utilizado para construir a amostra
library(mirt) # pacote utilizado para aplicação da TRI
library(WrightMap) # pacote utilizado para criar o Diagrama de Wright
library(ltm) # pacote utilizado para aplicação da TCT

# ---------------------------------------------
# Leitura dos arquivos dos microdados do Enem -
# ---------------------------------------------

df_resultado <- fread("~/Área\ de\ trabalho/DEV/R/ENEM/microdados_enem_2019/DADOS/MICRODADOS_ENEM_2019.csv")

# --------------------------------------------------------------------
# Seleção da amostra, a partir de Amostragem Aleatória Simples - AAS -
# --------------------------------------------------------------------

df_resultado <- df_resultado %>%
  filter(TP_PRESENCA_MT == 1)

df_amostra <- some(x = df_resultado, n = 10000)

# -------------------------------------------------------------
# Criando DataFrame com os resultados dos itens de matemática -
# -------------------------------------------------------------

for(n in 1:str_length(df_amostra$TX_RESPOSTAS_MT[1])){
  newcol <- ifelse((str_sub(df_amostra$TX_RESPOSTAS_MT, n, n)==
                      str_sub(df_amostra$TX_GABARITO_MT, n, n)), 1, 0)
  df_amostra[, ncol(df_amostra) + 1] <- newcol
  colnames(df_amostra)[ncol(df_amostra)] <- paste0('Q', n)
}
df_questoes <- df_amostra[137:181]

# -----------------------------------------------------------
# Aplicando rotinas de estatística clássica com base na TCT -
# -----------------------------------------------------------

des <- descript(df_questoes)
escore_total <- as.vector(rowSums(df_questoes))

# ---------------------------------------------------------------
# Aplicando o modelo de 3 parâmetros logísticos à base de dados -
# ---------------------------------------------------------------

modelo <- mirt(df_questoes, 1, itemtype = "3PL")
modelo_coef <- coef(modelo, simplify = TRUE, IRTpars = TRUE)

# ----------------------------
# Parâmetro de discriminação -
# ----------------------------


plot(modelo, type='trace', which.item = c(23, 5), facet_items=T, 
     as.table = TRUE, auto.key=list(points=F, lines=T, columns=4, space = 'top', cex = .8), 
     theta_lim = c(-3, 3), 
     main = "")

# --------------------------
# Parâmetro de dificuldade -
# --------------------------


plot(modelo, type='trace', which.item = c(19, 9), facet_items=T, 
     as.table = TRUE, auto.key=list(points=F, lines=T, columns=4, space = 'top', cex = .8), 
     theta_lim = c(-3, 3), 
     main = "")

# ------------------------------
# Parâmetro de acerto ao acaso -
# ------------------------------


plot(modelo, type='trace', which.item = c(5, 13), facet_items=T, 
     as.table = TRUE, auto.key=list(points=F, lines=T, columns=4, space = 'top', cex = .8), 
     theta_lim = c(-3, 3), 
     main = "")

# ----------------------------
# Visualizando a CCT e a CIT -
# ----------------------------

plot(modelo)
plot(modelo, type = "info")
plot(modelo, type = "infoSE")
plot(modelo, type = "trace")
plot(modelo, type = "infotrace")
plot(modelo, type = "trace", facet_item = F)
plot(modelo, type = "infotrace", facet_item = F)

# ---------------------------------------------------
# Calculando o escore de cada um dos(as) estudantes -
# ---------------------------------------------------

prof <- as.vector(fscores(modelo))

prof_padronizada <- (prof * 50) + 250

# -----------------------------------
# Visualizando o Diagrama de Wright -
# -----------------------------------

wrightMap(prof, modelo_coef$items[, 2])

# -----------------------------------
# Escore total bruto e proficiência -
# -----------------------------------

plot(prof, 
     escore_total, 
     title("Relação entre quantificação de acertos e proficiência"),
     xlab = "Proficiência",
     ylab = "Escore total bruto")

cor(prof_padronizada, escore_total, method = "pearson")
