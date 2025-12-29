# Requre o pacote readr e stringi
library(readr)

# Lê um arquivo txt
file_adjust <- read_delim("~/R/GGPLOT2/LAYERS/Adjust_posit.txt", delim="|")

# Converte em data frame
file_adjust <- as.data.frame(file_adjust)

# Visualiza a tabela
View(file_adjust)
