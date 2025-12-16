# Requre o pacote readr e stringi
library(readr)

# Lê um arquivo txt
file_scale <- read_delim("~/R/GGPLOT2/SCALES/Scale.txt", delim="|")

# Converte em data frame
df_scale <- as.data.frame(file_scale)

# Visualiza a tabela de escalas de acordo com cada tipo de estética e tipo
# de variável
View(df_scale)
