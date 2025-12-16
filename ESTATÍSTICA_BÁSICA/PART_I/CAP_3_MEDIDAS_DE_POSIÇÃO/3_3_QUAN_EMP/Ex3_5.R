###############################################################################
############################# Script Exemplo 3.5 ##############################
###############################################################################

# Cria um vetor com os dados do exemplo
c3_5a <- c(15,5,3,8,10,2,7,11,12)

# Calcula a mediana
median(c3_5a)

# Calcula a média
mean(c3_5a)

# Calcula os quantis empíricos
quantile(c3_5a, probs = c(.25,.50,.75), type = 6)

# Adiciona a observação 67 ao vetor x
c3_5b <- c(sort(c3_5a),67)

# Calcula a mediana de c3_5b
median(c3_5b)

# Calcula a mediana de c3_5b
mean(c3_5b)

# Calcula os quantis empíricos de c3_5b 
print(quantile(c3_5b, probs = c(.25,.50,.75), type = 6))
