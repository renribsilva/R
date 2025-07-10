###############################################################################
################################## POSITION ###################################
###############################################################################

# As justificações podem ser especificadas com um nome
"left"
"right"
"centre"
"center"
"bottom"
"top"

# As justificações podem ser especificadas com vetor de comprimero 2.
# Um número entre 0 e 1 indica a posição dentro da string (a partir do
# canto inferior esquerdo)
c(x,y)
c(0, 0) # é a posição de origem (justificado no canto inferior esquerdo)

###############################################################################
#################################### COLOUR####################################
###############################################################################

# The arguments can understand a name, which list is displayed by
colour()

# The arguments can understand rgb specification which is got with
# a string of the form 
"#RRGGBB"
col2hcl()
col2rgb()

# As cores podem ser especificadas com a função alpha(), que dá 
# a elas transparência. 'NA' sets for a completely # transparent colour
alpha()

# As cores podem ser especificadas com as funções rgb(), hsv(), hcl()
rgb()
hsv()
hcl()

# Paletas Brewer
RColorBrewer::display.brewer.all()

###############################################################################
################################# LINE TYPE ###################################
###############################################################################

# As linhas podem ser especificadas com integer ou nomes
0 = "blank"
1 = "solid"
2 = "dashed"
3 = "dotted"
4 = "dotdash"
5 = "longdash"
6 = "twodash"

# Os tipos de linhas podem ser especificados com dígitos hexadecimais (até 8)
"33" #  specifies three units on followed by three of
"3313" # specifies three units on followed by three off followed by one on and finally three of

###############################################################################
################################### SHAPE #####################################
###############################################################################

# As formas podem ser especificadas por integer
0:20 # cada integer corresponde a uma forma

# As formas podem ser especificadas por caracteres simples
"*" # a função entenderá este caractere como o símbolo de plotagem

# As formas podem ser especificadas por um "."
"." # a função entenderá o ponto como "o menor retângulo visível"

# As formas podem ser especificadas por 'NA'
NA # a função plota nada

###############################################################################
################################### SIZE ######################################
###############################################################################

# O tamanho pode ser especificado com um número
1 # a função entederá como 1 mm




