# Requre o pacote readr e stringi
library(readr)

# Lê um arquivo txt
file_stats <- read_delim("~/R/GGPLOT2/LAYERS/Stats.txt", delim="|")

# Converte em data frame
file_stats <- as.data.frame(file_stats)

# Dá nomes às colunas da tabela
names(file_stats) <- c("Tipo de stat", "Descrição")

# Visualiza a tabela
View(file_stats)
