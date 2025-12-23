#------------------------
# Importa os microdados -
#------------------------

table <- fread("2019/MICRODADOS/microdados_enem_2019/DADOS/MICRODADOS_ENEM_2019.csv")

# Filtra colunas
# table <- table %>%
#   dplyr::select(-NU_ANO,
#                 -TP_ESTADO_CIVIL, -TP_NACIONALIDADE,
#                 -TP_ST_CONCLUSAO, -TP_ANO_CONCLUIU,
#                 -CO_MUNICIPIO_ESC, -NO_MUNICIPIO_ESC, 
#                 -CO_UF_ESC, -SG_UF_ESC, -TP_DEPENDENCIA_ADM_ESC,
#                 -TP_LOCALIZACAO_ESC, -TP_SIT_FUNC_ESC,
#                 -Q001, -Q002, -Q003, -Q004, -Q005, -Q006, -Q007, 
#                 -Q008, -Q009, -Q010, -Q011, -Q012, -Q013, -Q014, 
#                 -Q015, -Q016, -Q017, -Q018, -Q019, -Q020, -Q021,
#                 -Q022, -Q023, -Q024, -Q025)

#-----------------------
# Rotulagem de fatores -
#-----------------------

# table$IN_TREINEIRO <- factor(table$IN_TREINEIRO, levels = c(1,0),  labels=c('Sim','Não'))
# table$TP_SEXO <- factor(table$TP_SEXO, levels = c('M','F'), labels=c('Maculino','Feminino'))
# table$TP_COR_RACA <- factor(table$TP_COR_RACA, levels = c(0,1,2,3,4,5,6),
#                                labels=c('Não declarado',
#                                         'Branca','Preta',
#                                         'Parda','Amarela',
#                                         'Indígena',
#                                         'Não dispõe da informação'))
# table$TP_ESCOLA <- factor(table$TP_ESCOLA, levels = c(1,2,3,4),
#                              labels=c('Não respondeu',
#                                       'Pública',
#                                       'Privada',
#                                       'Exterior'))
# table$TP_PRESENCA_CN <- factor(table$TP_PRESENCA_CN, levels = c(0,1,2),
#                                    labels=c('Faltou na prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))
# table$TP_PRESENCA_CH <- factor(table$TP_PRESENCA_CH, levels = c(0,1,2),
#                                   labels=c('Faltou na prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))
# table$TP_PRESENCA_LC <- factor(table$TP_PRESENCA_LC, levels = c(0,1,2),
#                                   labels=c('Faltou na prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))
# table$TP_PRESENCA_MT <- factor(table$TP_PRESENCA_MT, levels = c(0,1,2),
#                                   labels=c('Faltou na prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))
# table$CO_PROVA_CN <- factor(table$CO_PROVA_CN, levels = c(503,504,505,506,519,523,543,544,545,546),
#                                labels=c('Azul','Amarela','Cinza',
#                                         'Rosa','Laranja - Adaptada Ledor',
#                                         'Verde - Videoprova - Libras)',
#                                         'Amarela (Reaplicação)',
#                                         'Cinza (Reaplicação)',
#                                         'Azul (Reaplicação)',
#                                         'Rosa (Reaplicação)'))
# table$CO_PROVA_CH <- factor(table$CO_PROVA_CH, levels = c(507,508,509,510,520,524,547,548,549,550,564),
#                                labels=c('Azul','Amarela','Branca',
#                                        'Rosa','Laranja - Adaptada Ledor',
#                                        'Verde - Videoprova - Libras)',
#                                        'Azul (Reaplicação)',
#                                        'Amarela (Reaplicação)',
#                                        'Branca (Reaplicação)',
#                                        'Rosa (Reaplicação)',
#                                        'Laranja - Adaptada Ledor (Reaplicação)'))
# table$CO_PROVA_LC <- factor(table$CO_PROVA_LC, levels = c(511,512,513,514,521,525,551,552,553,554,565),
#                                labels=c('Azul','Amarela','Rosa','Branca',
#                                         'Laranja - Adaptada Ledor',
#                                         'Verde - Videoprova - Libras)',
#                                         'Azul (Reaplicação)',
#                                         'Amarela (Reaplicação)',
#                                         'Branca (Reaplicação)',
#                                         'Rosa (Reaplicação)',
#                                         'Laranja - Adaptada Ledor (Reaplicação)'))
# table$CO_PROVA_MT <- factor(table$CO_PROVA_MT, levels = c(515,516,517,518,522,526,555,556,557,558),
#                                 labels=c('Azul','Amarela','Rosa',
#                                          'Cinza',
#                                          'Laranja - Adaptada Ledor',
#                                          'Verde - Videoprova - Libras)',
#                                          'Amarela (Reaplicação)',
#                                          'Cinza (Reaplicação)',
#                                          'Azul (Reaplicação)',
#                                          'Rosa (Reaplicação)'))
# table$ TP_LINGUA <- factor(table$ TP_LINGUA, levels = c(0,1),
#                                labels=c('Inglês','Espanhol'))
# table$TP_STATUS_REDACAO <- factor(table$TP_STATUS_REDACAO, levels = c(1,2,3,4,5,6,7,8,9),
#                                      labels=c('Sem problemas',
#                                               'Anulada','Cópia Texto Motivador',
#                                               'Em Branco','Fere Direitos Humanos',
#                                               'Fuga ao tema',
#                                               'Não atendimento ao tipo',
#                                               'Texto insuficiente',
#                                               'Parte desconectada'))

#----------------------------------------------------
# Filtragem para não treineiros e aplicação regular -
#----------------------------------------------------

batch_size <- 50000
total_rows <- nrow(table)
num_batches <- ceiling((total_rows/batch_size))

table_filtered <- data.table()

for (i in 1:num_batches) {
  start_row <- (i-1)*batch_size+1
  end_row <- min(i*batch_size, total_rows)
  dados_batch <- table[start_row:end_row]
  dados_batch_filtered <- dados_batch[
    IN_TREINEIRO == 0 &
    (CO_PROVA_LC == 511 | CO_PROVA_LC == 512 | CO_PROVA_LC == 513 | CO_PROVA_LC == 514 | CO_PROVA_LC == 521 | CO_PROVA_LC == 525) &
    (CO_PROVA_CH == 507 | CO_PROVA_CH == 508 | CO_PROVA_CH == 509 | CO_PROVA_CH == 510 | CO_PROVA_LC == 520 | CO_PROVA_LC == 524) &
    (CO_PROVA_CN == 503 | CO_PROVA_CN == 504 | CO_PROVA_CN == 505 | CO_PROVA_CN == 506 | CO_PROVA_LC == 519 | CO_PROVA_LC == 523) &
    (CO_PROVA_MT == 515 | CO_PROVA_MT == 516 | CO_PROVA_MT == 517 | CO_PROVA_MT == 518 | CO_PROVA_LC == 522 | CO_PROVA_LC == 526)
]
  table_filtered <- rbindlist(list(table_filtered, dados_batch_filtered))
  cat("Batch", i, "de", num_batches, "processado", "(",start_row, " até ", end_row,")\n")
  rm(start_row, end_row, dados_batch, dados_batch_filtered)
  gc()
}

#-----------------------------
# Escreve table_filtered.csv -
#-----------------------------

write.csv(table_filtered, file = paste0("2019/MICRODADOS/table_filtered.csv"), row.names = FALSE)
