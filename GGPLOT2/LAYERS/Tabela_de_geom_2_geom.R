# Requre o pacote readr e stringi
library(readr)

# Lê um arquivo txt
file_geom_2_geom <- read_delim("~/R/GGPLOT2/LAYERS/Geoms_2_geoms.txt", delim="|")

# Converte em data frame
df_geom_2_geom <- as.data.frame(file_geom_2_geom)

# Visualiza a tabela
View(df_geom_2_geom)
