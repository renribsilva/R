# draws an area plot, which is a line plot filled to the y-axis
# (filled lines). Multiple groups will be stacked on top of each other.
geom_area()

# makes a barchart. The argument stat = "identity" override the default 
# stat "counts" values. The identity stat leaves the data unchanged. 
# By default, multiple bars in the same location will be stacked 
# on top of one another. The identity stat leaves the data unchanged
geom_bar(stat = "identity")

# makes a line plot. The group aesthetic determines which observations 
# are connected; see Section 4.5.3 for more details. 
geom_line()

# is similar to a geom_line, but lines are connected in the order they 
# appear in the data, not from left to right. 
geom_path()

# produces a scatterplot
geom_point()

# draws polygons, which are filled paths. Each vertex of the polygon requires 
# a separate row in the data. It is often useful to merge a data frame of 
# polygon coordinates with the data just prior to plotting. Section 5.7
# illustrates this concept in more detail for map data.
geom_polygon()

# adds labels at the specified points. This is the only geom in this group 
# that requires another aesthetic: label. It also has optional aesthetics 
# hjust and vjust that control the horizontal and vertical position of the 
# text; and angle which controls the rotation of the text. See Appendex B 
# for more details
geom_text()

# makes a image plot or level plot. The tiles form a regular tessellation 
# of the plane and typically have the fill aesthetic mapped to another variable
geom_tile()

# box-and-whisker plot, for a continuous variable conditioned by a categorical
# variable. This is a useful display when the categorical variable has many 
# distinct values
geom_boxplot() = stat_boxplot() + geom_boxplot()

# a crude way of looking at discrete distributions by adding random noise 
# to the discrete values so that they don’t overplot. An example is shown in 
# Figure 5.5
geom_jitter() = position_jitter() + geom_point()

# Use a density plot when you know that the underlying density is smooth, 
# continuous and unbounded. The (, adjust =) parameter make the density 
# more or less smooth
geom_density() = stat_density() + geom_area()

# Geoms that display intervals, useful for visualising uncertainty
geom_ribbon  # For continuos variable: aes a range
geom_smooth(stat="identity") # For continuos variable: aes a range and center
geom_errorbar # For discrete variable: aes a range
geom_linerange # For discrete variable: aes a range
geom_crossbar # For discrete variable: aes a range and center
geom_pointrange # For discrete variable: aes a range and center

# Geoms for annotating. All these geoms have an arrow parameter, which 
# allows you to place an arrowhead on the line. You create arrowheads with 
# the arrow() function, which has arguments angle, length, ends and type.
geom_text() # for adding text descriptions or labelling points. 
geom_vline() # add vertical lines to a plot.
geom_hline() # add horizontal lines to a plot.
geom_abline() # add lines with arbitrary slope and intercept to a plot.
geom_rect() # for highlighting interesting rectangular regions of the plot.
geom_line() # for adding lines
geom_path() # for adding lines
geom_segment() # for adding lines