#-----------------------------------------
# Gerenciador de dependências dos pacotes-
#-----------------------------------------

install.packages("pak")
library(pak)

#-----------
# Tidyverse-
#-----------

sysreqs_check_installed("tidyverse")
install.packages("tidyverse")

#-----------
# Mirt-
#-----------

sysreqs_check_installed("mirt")
install.packages("mirt")

#-----------
# wrightMap-
#-----------

sysreqs_check_installed("WrightMap")
install.packages("WrightMap")

#-----------
# latticeExtra-
#-----------

sysreqs_check_installed("latticeExtra")
install.packages("latticeExtra")

#----------
# ggplot2 -
#----------

sysreqs_check_installed("ggplot2")
install.packages("ggplot2")

