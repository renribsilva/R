# Requre o pacote readr e stringi
library(readr)

# Lê como arquivo separado por espaços em branco
tb_aes_geom <- read_table2("~/R/GGPLOT2/LAYERS/Geom_aes_espec.txt")

# Converte em data frame
df_aes_geom <- as.data.frame(tb_aes_geom)

# Dá nome às variáveis
names(df_aes_geom) <- c(v1="Name", 
                   v2="Default stat",
                   v3="Aes1",
                   v4="Aes2",
                   v5="Aes3",
                   v6="Aes4",
                   v7="Aes5",
                   v8="Aes6",
                   v9="Aes7",
                   v10="Aes8",
                   v11="Aes9",
                   v12="Aes10")

# Tabela de objetos geométricos, sua transformações estatística padrão
# e suas propriedades estéticas obrigatórias e opcionais
View(df_aes_geom)
