###############################################################################
############################## Script Tabela 4.4 ##############################
###############################################################################

# Executa a base de dados
source("PART_I/CAP_4_ANÁLISE_BIDIMENSIONAL/Tab4_2.R")

# Monta um dataframe para plotagem
df4_5 <- melt(tab4_2[1:3,], 
              varnames = c("reg_procedencia","grau_instrucao")) %>%
  as.data.frame()

# Cria o gráfico
ggplot(df4_5, aes(x = grau_instrucao, y = value, fill = reg_procedencia)) +
  geom_bar(stat = "identity", position = "fill") +
  scale_fill_brewer(name="Região de\n Procedência",
                    palette = "Set3") +
  scale_y_continuous(labels = percent_format()) +
  labs(x = "Grau de Instrução",
       y = "",
       title = "Figura 4.1: Distribuição da região de procedência por grau de instrução") +
  theme(panel.background = element_blank(),
        panel.border = element_rect(colour = "black", fill= NA))