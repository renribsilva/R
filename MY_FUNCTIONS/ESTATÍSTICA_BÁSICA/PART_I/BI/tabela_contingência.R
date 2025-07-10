tabela_contingência <- function(data, 
                      vary = "variável distribuída na vertical", 
                      varx = "variável distrubuída na horizontal", 
                      dist = "abs, rel, abs_rel, res, dev ou res_dev",
                      margin = NULL,
                      expected = NULL,
                      coef = NULL) {
  
  # Mensagem de erro nas variáveis de interesse
  if (!(vary %in% names(data)) || !(varx %in% names(data))) {
    stop("As variáveis especificadas não estão presentes nos dados.")
  }
  
  # Mensagem de erro na especificação da frequência
  if (is.null(dist) || !(dist %in% c("abs", "rel", "abs_rel", "dev", "qui"))) {
    stop("Tipo de distribuição não especificada ou incorreta")
  }
  
  # Mensagem de erro na especificação da margin
  if (!(dist %in% c("rel", "abs_rel")) & (!(is.null(margin)) ||
                                          !(is.null(expected)))) {
    stop("Margin e Expected não precisam ser especificados")
  } else if (!(dist %in% c("abs", "dev", "qui")) & (!(margin %in% c(0,1,2)) ||
                                             !(is.logical(expected)))) {
    stop("Margin ou Expected não especificado ou incorreto")
  }
  
  # Cria objetos para a posição das variáveis no data frame
  nc <- colnames(data)
  vx <- which(nc == varx)
  vy <- which(nc == vary)
  
  # Cria uma matrix com a distribuição conjunta em frequência absoluta
  tab <- table(data[[vy]], data[[vx]])
  tabm0 <- tab %>% prop.table()*100
  tabm1 <- tab %>% prop.table(margin = 1)*100
  tabm2 <- tab %>% prop.table(margin = 2)*100
  
  # Cria objetos com os nomes das categorias das variáveis
  rn <- dimnames(tab)[[1]]
  cn <- dimnames(tab)[[2]]
  
  # Cria marginais vazios
  row_total <- NULL
  col_total <- NULL
  
  # Mapeia as marginais
  fun_margin <- function(x) {
    r <- matrix(nrow = 1, ncol = dim(tab)[2])
    c <- matrix(nrow = dim(tab)[1], ncol = 1)
    # Maginais
    mar1 <- apply(x, MARGIN = 1, FUN = sum)
    mar2 <- apply(x, MARGIN = 2, FUN = sum)
    # Mapeamento
    row_total <<- purrr::map2(r, mar2,\(r, mar2) mar2)
    col_total <<- purrr::map2(c, mar1,\(c, mar1) mar1)
  }
  
  # Cria a tabela com frequências absolutas
  if (dist == "abs" &
      any(colnames(data) == varx) &
      any(colnames(data) == vary)) {
    
    # Cria as linhas de totais
    fun_margin(tab)
    tab_abs <- rbind(cbind(tab, col_total), c(row_total, sum(unlist(row_total))))
    colnames(tab_abs) <- c(cn, "Total")
    rownames(tab_abs) <- c(rn, "Total")
    tab_abs
    
    # Cria a tabela com frequências relativas
  } else if (dist == "rel" &
             any(colnames(data) == varx) &
             any(colnames(data) == vary)) {
    
    # distribuindo-as em relação ao total geral das variáveis X e Y
    if (margin == 0) {
      
      fun_margin(tabm0)
      tab_rel_0 <- rbind(cbind(tabm0, col_total), c(row_total, sum(unlist(row_total))))
      tab_rel_0 <- lapply(tab_rel_0, function(x) sprintf("%.1f%%", x)) %>%
        matrix(ncol = dim(tab_rel_0)[2])
      colnames(tab_rel_0) <- c(cn, "Total")
      rownames(tab_rel_0) <- c(rn, "Total")
      tab_rel_0
      
      # distribuindo-as em relação aos totais de cada variável X
    } else if (margin == 1) {
      
      fun_margin(tabm1)
      tab_rel_1 <- rbind(cbind(tabm1, col_total), 
                         c(prop.table(unlist(row_total))*100, 
                           sum(prop.table(unlist(row_total))*100)))
      tab_rel_1 <- lapply(tab_rel_1, function(x) sprintf("%.1f%%", x)) %>%
        matrix(ncol = dim(tab_rel_1)[2])
      colnames(tab_rel_1) <- c(cn, "Total")
      rownames(tab_rel_1) <- c(rn, "Total")
      
      if (isFALSE(expected)) {
        
        tab_rel_1
        
      } else if (isTRUE(expected)) {
        
        for(i in 1:dim(tab)[1]) {
          for(j in 1:dim(tab)[2]) {
            tab_rel_1[i:dim(tab)[1],j] <- tab_rel_1[dim(tab_rel_1)[1],][j]
          }
          return(tab_rel_1)
        }
      }
      
      # distribuindo-as em relação aos totais de cada variável Y  
    } else if (margin == 2) {
      
      fun_margin(tabm2)
      tab_rel_2 <- rbind(cbind(tabm2, prop.table(unlist(col_total))*100), 
                         c(row_total, sum(prop.table(unlist(col_total))*100)))
      tab_rel_2 <- lapply(tab_rel_2, function(x) sprintf("%.1f%%", x)) %>%
        matrix(ncol = dim(tab_rel_2)[2])
      colnames(tab_rel_2) <- c(cn, "Total")
      rownames(tab_rel_2) <- c(rn, "Total")
      
      if (isFALSE(expected)) {
        
        tab_rel_2
        
      } else if (isTRUE(expected)) {
        
        for(j in 1:dim(tab)[2]){
          for(i in 1:dim(tab)[1]) {
            tab_rel_2[i,j:dim(tab)[2]] <- tab_rel_2[,dim(tab_rel_2)[2]][i]
          }
        }
        
        tab_rel_2
      }
    }
    
    # Cria a tabela com frequências absolutas e relativas 
  } else if (dist == "abs_rel" &
             any(colnames(data) == varx) &
             any(colnames(data) == vary)) {
    
    # distribuindo as frequências relativas em relação ao total geral 
    # das variáveis X e Y
    if (margin == 0) {
      
      fun_margin(tab)
      tab_abs <- rbind(cbind(tab, col_total), c(row_total, sum(col_total)))
      
      fun_margin(tabm0)
      tab_rel_0 <- rbind(cbind(tabm0, col_total), c(row_total, sum(col_total)))
      tab_rel_0 <- lapply(tab_rel_0, function(x) sprintf("%.1f%%", x))
      tab_abs_rel_0 <- purrr::map2(tab_abs, tab_rel_0, ~paste0(.x, "(", .y, ")")) %>%
        matrix(ncol = dim(tab_abs)[2])
      colnames(tab_abs_rel_0) <- c(cn, "Total")
      rownames(tab_abs_rel_0) <- c(rn, "Total")
      tab_abs_rel_0
      
      # distribuindo as frequências relativas em relação ao total de cada
      # categora da variáveis X  
    } else if (margin == 1) {
      
      # Adiciona linha e coluna com os totais
      fun_margin(tab)
      tab_abs <- rbind(cbind(tab, col_total), c(row_total, sum(unlist(col_total))))
      
      fun_margin(tabm1)
      tab_rel_1 <- rbind(cbind(tabm1, col_total), 
                         c(prop.table(unlist(row_total))*100, 
                           sum(prop.table(unlist(row_total))*100)))
      tab_rel_1_temp <- lapply(tab_rel_1, function(x) sprintf("%.1f%%", x))
      tab_abs_rel_1 <- purrr::map2(tab_abs, tab_rel_1_temp, ~paste0(.x, "(", .y, ")")) %>%
        matrix(ncol = dim(tab_abs)[2])
      colnames(tab_abs_rel_1) <- c(cn, "Total")
      rownames(tab_abs_rel_1) <- c(rn, "Total")
      
      if (isFALSE(expected)) {
        
        tab_abs_rel_1
        
      } else if (isTRUE(expected)) {
        
        for(i in 1:dim(tab)[1]) {
          for(j in 1:dim(tab)[2]) {
            row_total <- unlist(row_total)
            col_total <- unlist(col_total)
            tab_abs[i,j] <- round(prop.table(apply(tab, MARGIN = 2, FUN = sum))[j]*
                                    apply(tab, MARGIN = 1, FUN = sum)[i], digits = 1)
            tab_rel_1[i,j] <- prop.table(unlist(row_total))[j]*100
          }
        } 
        
        tab_rel_1_temp <- lapply(tab_rel_1, function(x) sprintf("%.1f%%", x))
        tab_abs_rel_1 <- purrr::map2(tab_abs, tab_rel_1_temp, ~paste0(.x, "(", .y, ")")) %>%
          matrix(ncol = dim(tab_abs)[2])
        colnames(tab_abs_rel_1) <- c(cn, "Total")
        rownames(tab_abs_rel_1) <- c(rn, "Total")
        tab_abs_rel_1
        
      }
      
      # distribuindo as frequências relativas em relação ao total de cada
      # categora da variáveis Y  
    } else if (margin == 2) {
      
      # Adiciona linha e coluna com os totais
      fun_margin(tab)
      tab_abs <- rbind(cbind(tab, col_total), c(row_total, sum(unlist(col_total))))
      
      fun_margin(tabm2)
      tab_rel_2 <- rbind(cbind(tabm2, prop.table(unlist(col_total))*100), 
                         c(row_total, sum(prop.table(unlist(col_total))*100)))
      
      tab_rel_2_temp <- lapply(tab_rel_2, function(x) sprintf("%.1f%%", x))
      tab_abs_rel_2 <- purrr::map2(tab_abs, tab_rel_2_temp, ~paste0(.x, "(", .y, ")")) %>%
        matrix(ncol = dim(tab_abs)[2])
      colnames(tab_abs_rel_2) <- c(cn, "Total")
      rownames(tab_abs_rel_2) <- c(rn, "Total")
      
      if (isFALSE(expected)) {
        
        tab_abs_rel_2
        
      } else if (isTRUE(expected)) {
        
        for(i in 1:dim(tab)[1]) {
          for(j in 1:dim(tab)[2]) {
            row_total <- unlist(row_total)
            col_total <- unlist(col_total)
            tab_abs[i,j] <- round(prop.table(apply(tab, MARGIN = 1, FUN = sum))[j]*
                                    apply(tab, MARGIN = 2, FUN = sum)[i], digits = 1)
            tab_rel_2[i,j] <- prop.table(unlist(col_total))[i]*100
          }
        }
        
        tab_rel_2_temp <- lapply(tab_rel_2, function(x) sprintf("%.1f%%", x))
        tab_abs_rel_2 <- purrr::map2(tab_abs, tab_rel_2_temp, ~paste0(.x, "(", .y, ")")) %>%
          matrix(ncol = dim(tab_abs)[2])
        colnames(tab_abs_rel_2) <- c(cn, "Total")
        rownames(tab_abs_rel_2) <- c(rn, "Total")
        tab_abs_rel_2
        
      }
    }
  } else {
    
    fun_margin(tab)
    tab2 <- matrix(data = NA, nrow = dim(tab)[1], ncol = dim(tab)[2])
    
    for(j in 1:dim(tab)[2]) {
      for(i in 1:dim(tab)[1]) {
        tab2[i,j] <- round(prop.table(unlist(row_total))[j]*
                             apply(tab, MARGIN = 1, FUN = sum)[i])
      }
    }
    
    tab_res <- purrr::map2(tab, tab2, `-`) %>%
      matrix(ncol = dim(tab2)[2])
    
    tab_dev <- purrr::map2(matrix(unlist(lapply(
      tab_res, function(x) x^2)), nrow = nrow(tab_res)), 
      tab2, function(x, y) round(x / y, digits = 1)) %>%
      matrix(ncol = dim(tab2)[2])
    
    tab_res_dev <- purrr::map2(tab_res, tab_dev, ~paste0(.x, "(", .y, ")"))  %>%
      matrix(ncol = dim(tab2)[2])
    
    if (dist == "res") {
      
      colnames(tab_res) <- c(cn)
      rownames(tab_res) <- c(rn)
      tab_res
      
    } else if (dist == "dev") {
      
      colnames(tab_dev) <- c(cn)
      rownames(tab_dev) <- c(rn)
      tab_dev
      
    } else if (dist == "res_dev") {
      
      colnames(tab_res_dev) <- c(cn)
      rownames(tab_res_dev) <- c(rn)
      tab_res_dev
      
    }
  }
}

