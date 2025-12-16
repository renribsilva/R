# Requre o pacote readr e stringi
library(readr)

# Lê um arquivo txt
file_geoms <- read_delim("~/R/GGPLOT2/LAYERS/Geoms.txt", delim="|")

# Converte em data frame
file_geoms <- as.data.frame(file_geoms)

# Dá nomes às colunas da tabela
names(file_geoms) <- c("Tipo de geom", "Descrição")

# Visualiza a tabela
View(file_geoms)
