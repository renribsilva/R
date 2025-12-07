# Lista todos os pacotes não nativos
user_pkgs <- installed.packages()[, "Package"]
user_pkgs <- user_pkgs[!installed.packages()[, "Priority"] %in% c("base", "recommended")]
user_pkgs

# Pega todos os pacotes instalados
ip <- installed.packages()

# Filtra os que estão na biblioteca padrão do usuário (~/.R) e não na base do R
user_pkgs <- ip[!ip[, "Priority"] %in% c("base", "recommended"), ]

# Mostra apenas os nomes
rownames(user_pkgs)
