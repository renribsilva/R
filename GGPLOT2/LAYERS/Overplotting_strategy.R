# Distribui randomicamente pontos nos eixos x e y
df <- data.frame(x = rnorm(2000), y = rnorm(2000))
norm <- ggplot(df, aes(x, y))
norm + geom_point()

# Set hollow glyphs
norm + geom_point(shape = 1)

# Make the points smaller
norm + geom_point(shape = ".") # Pixel sized

# Make the points transparent with alpha blending. If you specify alpha as a
# ratio, the denominator gives the number of points that must be overplotted
# to give a solid colour. In R, the lowest amount of transparency you can
# use is 1/256, so it will not be effective for heavy overplotting.
norm + geom_point(colour = alpha("black", 1/3))
norm + geom_point(colour = alpha("black", 1/5))
norm + geom_point(colour = alpha("black", 1/10))

# Randomly jitter the points to alleviate some overlaps of some discreteness
# in the data. This is particularly useful in conjunction with transparency. 
# By default, the amount of jitter added is 40% of the resolution of the data, 
# which leaves a small gap between adjacent regions
td <- ggplot(diamonds, aes(table, depth)) +
  xlim(50, 70) + ylim(50, 70)
jit <- position_jitter(width = 0.5)
td + geom_point()
td + geom_jitter()
td + geom_jitter(position = jit)
td + geom_jitter(position = jit, colour = alpha("black", 1/10))
td + geom_jitter(position = jit, colour = alpha("black", 1/50))
td + geom_jitter(position = jit, colour = alpha("black", 1/200))

# Bin the points and count the number in each bin, then visualise that count
# in some way (the 2d generalisation of the histogram). 
d <- ggplot(diamonds, aes(carat, price)) + xlim(1,3)
d + stat_bin2d()
d + stat_bin2d(bins = 10)
d + stat_bin2d(binwidth=c(0.02, 200))
# Using hexagons instead, and this is implemented with geom_hexagon, 
# using the capabilities of the hexbin package.
d + stat_binhex()
d + stat_binhex(bins = 10)
d + stat_binhex(binwidth=c(0.02, 200))

# Estimate the 2d density with stat_density2d, and overlay contours from
# this distribution on the scatterplot
d <- ggplot(diamonds, aes(carat, price)) + xlim(1,3)
d + geom_point() + geom_density2d()
d + stat_density2d(geom = "point", aes(size = ..density..),
                   contour = F) + scale_size_area(minor_breaks = c(0.1, 1.5))
# or display the density by itself as coloured tiles, or points with size 
# proportional to density
d + stat_density2d(geom = "tile", aes(fill = ..density..),
                   contour = F)
last_plot() + scale_fill_gradient(limits = c(1e-5,8e-4))