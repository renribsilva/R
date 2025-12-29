# Requre o pacote readr e stringi
library(readr)

# Lê um arquivo txt
file_theme <- read_delim("~/R/GGPLOT2/THEME/Theme_elem.txt", delim="|")

# Converte em data frame
file_theme <- as.data.frame(file_theme)

# Visualiza a tabela
View(file_theme)
