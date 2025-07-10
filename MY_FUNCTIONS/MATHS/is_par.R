executar_loops <- TRUE

if (executar_loops) {
  # Primeiro loop
  print("Loop 1:")
  for (i in 1:5) {
    print(i)
  }
  
  # Segundo loop
  print("Loop 2:")
  for (j in 6:10) {
    print(j)
  }
} else {
  print("Os loops não serão executados.")
}