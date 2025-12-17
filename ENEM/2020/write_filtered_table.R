#------------------------
# Importa os microdados -
#------------------------

table <- fread("2019/MICRODADOS/microdados_enem_2019/DADOS/MICRODADOS_ENEM_2019.csv")

batch_size <- 50000
total_rows <- nrow(table)
num_batches <- ceiling((total_rows/batch_size))

table_filtered <- data.table()

for (i in 1:num_batches) {
  start_row <- (i-1)*batch_size+1
  end_row <- min(i*batch_size, total_rows)
  dados_batch <- table[start_row:end_row]
  dados_batch_filtered <- dados_batch[
    TP_PRESENCA_LC == 1 &
    TP_PRESENCA_CH == 1 &
    TP_PRESENCA_CN == 1 &
    TP_PRESENCA_MT == 1 &
    TP_LINGUA == 0 & 
    (CO_PROVA_LC == 511 | CO_PROVA_LC == 512 | CO_PROVA_LC == 513 | CO_PROVA_LC == 514) &
    (CO_PROVA_CH == 507 | CO_PROVA_CH == 508 | CO_PROVA_CH == 509 | CO_PROVA_CH == 510) &
    (CO_PROVA_CN == 503 | CO_PROVA_CN == 504 | CO_PROVA_CN == 505 | CO_PROVA_CN == 506) &
    (CO_PROVA_MT == 515 | CO_PROVA_MT == 516 | CO_PROVA_MT == 517 | CO_PROVA_MT == 518)
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
