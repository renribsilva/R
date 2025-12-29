# provides a flexible way of summarising the conditional distribution of y 
# with the aesthetics ymin, y and ymax. 
stat_summary()

# Individual summary functions
# The arguments fun.y, fun.ymin and fun.ymax accept simple numeric summary
# functions. You can use any summary function that takes a vector of
# numbers and returns a single numeric value: mean(), median(), min(), max().
midm <- function(x) mean(x, trim = 0.5)
m2 +
  stat_summary(aes(colour = "trimmed"), fun.y = midm, geom = "point") +
  stat_summary(aes(colour = "raw"), fun.y = mean, geom = "point") +
  scale_colour_hue("Mean")

# Single summary function
# fun.data can be used with more complex summary functions such as one
# of the summary functions from the Hmisc package (Harrell, 2008) described
# in Table 5.3. You can also write your own summary function. This summary
# function should return a named vector as output
iqr <- function(x, ...) {
  qs <- quantile(as.numeric(x), c(0.25, 0.75), na.rm = T)
  names(qs) <- c("ymin", "ymax")
  qs
  }
m + stat_summary(fun.data = "iqr", geom="ribbon")

