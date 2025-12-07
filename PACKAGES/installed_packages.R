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
