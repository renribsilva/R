# Função para processar cada área
process_area <- function(respostas, gabarito) {
  # transforma em lista de vetores e coloca NA em "." ou "*"
  r <- lapply(strsplit(respostas, ""), function(x) {
    x[x %in% c(".", "*")] <- NA
    x
  })
  # transforma gabarito em lista de vetores
  g <- strsplit(gabarito, "")
  # compara e transforma TRUE/FALSE em 1/0 mantendo NA
  comp_list <- mapply(function(r, g) {
    if (length(r) != length(g)) {
      stop("Erro: respostas e gabarito com comprimentos diferentes.")
    }
    res <- r == g
    as.integer(res)
  }, r, g, SIMPLIFY = FALSE)
  # junta em matriz
  mat <- do.call(rbind, comp_list)
  # substitui todos os NA por 0
  mat[is.na(mat)] <- 0
  return(mat)
}