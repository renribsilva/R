# ==============================================================================
# CONFIGURAÇÃO DO AMBIENTE - PROJETO ENEM
# ==============================================================================

# Define o diretório de trabalho
setwd("~/Área de trabalho/DEV/R/ENEM")

# 1. Verifica pacotes faltantes (Interrompe com erro se necessário)
if (!all(c("tidyverse", "data.table", "mirt", "WrightMap", "latticeExtra", "ggplot2", "psych") %in% utils::installed.packages()[, "Package"])) {
  stop(paste0(
    "\n\n", strrep("!", 60), "\n",
    " ❌ ERRO: PACOTES NÃO INSTALADOS!\n",
    strrep("-", 60), "\n",
    " Pacotes necessários: tidyverse, data.table, mirt, WrightMap, \n",
    "                      latticeExtra, ggplot2, psych\n\n",
    " 👉 Execute para instalar:\n",
    " install.packages(c('tidyverse', 'data.table', 'mirt', 'WrightMap', \n",
    "                    'latticeExtra', 'ggplot2', 'psych'))\n",
    strrep("!", 60), "\n"
  ), call. = FALSE)
}

# 2. Carregamento Silencioso (Esconde conflitos e mensagens de inicialização)
suppressPackageStartupMessages({
  library(tidyverse)
  library(data.table)
  library(mirt)
  library(WrightMap)
  library(latticeExtra)
  library(ggplot2)
  library(psych)
})

# 3. Mensagens de Status (Visual Formatado)
message("\n", strrep("=", 70))
message("  🚀 PROJETO: ", basename(getwd()))
message("  📂 DIRETÓRIO: ", getwd())
message(strrep("-", 70))
message("  📦 PACOTES CARREGADOS:")
message("  ", paste(setdiff(gsub("^package:", "", grep("^package:", search(), value = TRUE)),
                            c("stats", "graphics", "grDevices", "utils", "datasets", "methods", "base", "tools", "rstudioapi")),
                    collapse = " • "))
message(strrep("=", 70), "\n")
