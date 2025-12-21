#------------------------
# Importa os microdados -
#------------------------

table <- fread("2019/MICRODADOS/microdados_enem_2019/DADOS/MICRODADOS_ENEM_2019.csv")
table <- table %>%
  dplyr::select(-NU_INSCRICAO, -NU_ANO,
                -TP_ESTADO_CIVIL, -TP_NACIONALIDADE,
                -TP_ST_CONCLUSAO, -TP_ANO_CONCLUIU,
                -TP_ENSINO, -CO_MUNICIPIO_ESC, -NO_MUNICIPIO_ESC, 
                -CO_UF_ESC, -SG_UF_ESC, -TP_DEPENDENCIA_ADM_ESC,
                -TP_LOCALIZACAO_ESC, -TP_SIT_FUNC_ESC,
                -Q001, -Q002, -Q003, -Q004, -Q005, -Q006, -Q007, 
                -Q008, -Q009, -Q010, -Q011, -Q012, -Q013, -Q014, 
                -Q015, -Q016, -Q017, -Q018, -Q019, -Q020, -Q021,
                -Q022, -Q023, -Q024, -Q025)

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
