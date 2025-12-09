#-----------------------------------------
# Gerenciador de dependências dos pacotes-
#-----------------------------------------

install.packages("pak")
library(pak)

#-----------
# Tidyverse-
#-----------

sysreqs_check_installed("tidyverse")
sysreqs_install("tidyverse")
install.packages("tidyverse")

#-----------
# Mirt-
#-----------

sysreqs_check_installed("mirt")
sysreqs_install("mirt")
install.packages("mirt")
