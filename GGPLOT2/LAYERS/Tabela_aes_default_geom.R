# Requre o pacote readr e stringi
library(readr)

# Lê um arquivo txt
file_def_geom <- read_delim("~/R/GGPLOT2/LAYERS/Aes_default_geom.txt", delim="|")

# Converte em data frame
df_def_geom <- as.data.frame(file_def_geom)

# Visualiza a tabela de escalas de acordo com cada tipo de estética e tipo
# de variável
View(df_def_geom)
