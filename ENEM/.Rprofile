# ==============================================================================
# CONFIGURAÇÃO DO AMBIENTE - PROJETO ENEM
# ==============================================================================

# 1. Definição do Diretório de Trabalho
# ------------------------------------------------------------------------------
setwd("~/Área de trabalho/DEV/R/ENEM")

# 2. Gerenciamento de Pacotes
# ------------------------------------------------------------------------------
pacotes_necessarios <- c(
  "tidyverse", 
  "data.table", 
  "mirt", 
  "WrightMap", 
  "latticeExtra", 
  "ggplot2", 
  "psych"
)

# Identifica pacotes que não estão instalados
faltantes <- pacotes_necessarios[!(pacotes_necessarios %in% utils::installed.packages()[, "Package"])]

# Verifica se há pendências e exibe erro amigável
if (length(faltantes) > 0) {
  stop(paste0(
    "\n", strrep("!", 60), "\n",
    " ❌ ERRO: PACOTES NÃO ENCONTRADOS!\n",
    strrep("-", 60), "\n",
    " Os seguintes pacotes precisam ser instalados:\n",
    paste("- ", faltantes, collapse = "\n"),
    "\n\n 👉 Comando para instalar:\n",
    " install.packages(c(", paste0("'", faltantes, "'", collapse = ", "), "))\n",
    strrep("!", 60), "\n"
  ), call. = FALSE)
}

# Carregamento silencioso dos pacotes
invisible(
  suppressPackageStartupMessages(
    lapply(pacotes_necessarios, library, character.only = TRUE)))

# 3. Mensagens de Status (Visual Formatado)
# ------------------------------------------------------------------------------
message("\n", strrep("=", 70))
message("  🚀 PROJETO: ", basename(getwd()))
message("  📂 DIRETÓRIO: ", getwd())
message(strrep("-", 70))
message("  📦 PACOTES CARREGADOS:")

# Filtra para mostrar apenas o que está no vetor 'pacotes_necessarios'
message("  ", paste(intersect(pacotes_necessarios, 
                              gsub("^package:", "", grep("^package:", search(), value = TRUE))),
                    collapse = " • "))

message(strrep("=", 70), "\n")

# Remove os objetos para manter o ambiente limpo
rm(pacotes_necessarios, faltantes)
