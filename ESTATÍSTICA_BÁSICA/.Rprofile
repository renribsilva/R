# Define o diretório de trabalho como a raiz do projeto
setwd("~/Área de trabalho/DEV/R/ESTATÍSTICA_BÁSICA")

# Mensagem opcional
message("✔️ O projeto '", basename(getwd()),"' foi carregado com sucesso. O diretório de trabalho é: ", getwd())

# Carregamento automático de pacotes (opcional)
library(dplyr)
library(ggplot2)
library(readxl)
library(magrittr)
library(forcats)
library(tibble)
library(cowplot)
library(aplpack)

# Lista os pacotes carregados explicitamente com library() (sem criar objetos)
message("✔️ Pacotes carregados: ", 
        paste(setdiff(gsub("^package:", "", grep("^package:", search(), value = TRUE)),
                      c("stats", "graphics", "grDevices", "utils", "datasets", "methods", "base")),
              collapse = ", "))


# Opções globais (exemplo: nunca mostrar notação científica)
# options(scipen = 999)
