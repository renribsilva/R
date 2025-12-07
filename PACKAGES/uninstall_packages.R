# -------------------------------------------------------------------------------------------------------
# Pegar binários de https://packagemanager.posit.co/client/#/repos/cran/setup?distribution=ubuntu-24.04 -
# -------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------
# Definir repositório secundário https://cloud.r-project.org -
# ------------------------------------------------------------

# Remove todos os pacotes instalados manualmente
unlink(.libPaths()[1], recursive = TRUE)