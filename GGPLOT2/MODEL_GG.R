#$DATA AND MAPPING

  # Os argumentos podem ser omitidos se forem definidos nas camadas; (colour = )
  # define uma variável a ser mapeada; (group = ) define uma variável a ser 
  # agrupada; os argumentos de aes() podem receber funções
  gg <- ggplot(data, aes(x = , y = , colour = , fill = , group =)) 

#$LAYERS

  #GEOMS

    geom_XXX(
      
      # It mapping use the aes() function and combined its aesthetics with the plot
      # defaults. However, the default mappings created in the plot can be 
      # extended, overridden or remove here. The results affects only the 
      # current layer. For that reason, unless you modify the default scales,
      # axis labels and legend titles will be based on the plot defaults. 
      # Beside, each layer could be group individually
      mapping  = aes(),
      
      # Data could overrides the default plot dataset. It is most commonly
      # omitted, in which case the layer will use the default plot data
      data = ,
      
      # Stat override the default stat for a geom_XXX and usually creates
      # news variables that could be used in other geoms or stats
      stat = ,
      
      # Parameters for a specific geom_XXX
      ... = ,
      
      # Aesthetic properties as parameters. Here we set the aesthetic property 
      # to a fixed value, not map it to a variable in the dataset. 
      ... = ,
      
      # Position choose a method for adjusting overlapping objects
      position = )
  
  #STATS
    
    stat_XXX(
    
      # Mapping use the aes() function and combined its aesthetics with the plot
      # defaults. However, the default mappings created in the plot can be 
      # extended, overridden or remove here. The results affects only the 
      # current layer. For that reason, unless you modify the default scales,
      # axis labels and legend titles will be based on the plot defaults. 
      # Beside, each layer could be group individually
      mapping  = aes(),
      
      # Data could overrides the default plot dataset. It is most commonly
      # omitted, in which case the layer will use the default plot data
      data = ,
      
      # Geom override the default stat for a stat_XXX and usually creates
      # news variables that could be used in other geoms or stats
      geom = ,
      
      # Parameters for a specific stat_XXX
      ... = ,
      
      # Aesthetic properties as parameters. Here we set the aesthetic property 
      # to a fixed value, not map it to a variable in the dataset. 
      ... = ,
      
      # Position adjustment choose a method for adjusting overlapping objects
      position = )

#$SCALES
  
  # All scale constructors have a common naming scheme. They start with 
  # scale_, followed by the name of the aesthetic (e.g., colour_, shape_ or x_),
  # and finally by the name of the scale (e.g., gradient, hue or manual).
  # Transforming at the scale level occurs before statistics are computed 
  # and does not change the shape of the geom (see Coordinate System to
  # transformations after stat)
    
    #Argumentos comuns a todos as função scale_XXX_YYY()
    scale_XXX_YYY(
      
      # sets the label which will appear on the axis or legend. It can supply 
      # text strings (using \n for line breaks) or mathematical expressions 
      # (as described by ?plotmath). Name controls the axis label and 
      # the legend title
      name = , 
      
      # affect what appears on the plot, fixing the domain of the scale.
      # Any data outside the limits is not plotted and not included in 
      # the statistical transformation
      limits = ,
      
      # affect what appears on the axes and legends; controls which values 
      # appear on the axis or legend, i.e., what values tick marks should appear 
      # on an axis or how a continuous scale is segmented in a legend. It
      # control what tick marks appear on the axis and what keys appear 
      # on the legend. The internal grid lines are controlled by the breaks 
      # and minor breaks arguments
      breaks = , 
      
      #The internal grid lines are controlled by the breaks 
      # and minor breaks arguments
      minor_breaks = , 
      
      # specifies the labels that should appear at the breakpoints. If labels 
      # is set, you must also specify breaks, so that the two can be matched 
      # up correctly. It control what tick marks appear on the axis and what 
      # keys appear on the legend
      labels = ,
      
      # if no labels are specified the formatter will be called on each break 
      # to produce the label. Useful formatters for continuous scales are 
      # comma, percent, dollar and scientific, and for discrete scales is 
      # abbreviate
      formatter = )
    
    # ESCALAS PARA A ESTÉTICA POSIÇÃO
    # Argumentos adicionais em função scale_XXX_YYY() que determinam escalas
    # para estéticas de POSIÇÃO
    scale_XXX_YYY(
        
      # By default, the limits of position scales extend a little past the 
      # range of the data. It can control the amount of expansion with the 
      # expand argument. If you don’t want any extra space, 
      # use expand = c(0, 0)
      expand = ,
      
      # Some positional aesthetics works with continuous variables. Every 
      # continuous scale takes a trans argument, allowing the specification 
      # of a variety of transformations, both linear and non-linear
      trans = ,
      
      # specify the position of major breaks in terms of date units, years, 
      # months, weeks, days, hours, minutes and seconds, and can be combined 
      # with a multiplier
      major = , 
      
      #  specify the position of minor breaks in terms of date units, years, 
      # months, weeks, days, hours, minutes and seconds, and can be combined 
      # with a multiplier      
      minor = , 
      
      # specifies how the tick labels should be formatted for a data scale
      format = )
      
      # A common task for all position axes is changing the axis limits. 
      # Because this is such a common task, ggplot2 provides a couple 
      # of helper functions to save you some typing all parameters of 
      # scale_XXX_YYY
      xlim() 
      ylim()
      lims()
      labs()
      guides()
      
    # ESCALAS PARA A ESTÉTICA COR
    # função scale_XXX_YYY() que determinam escalas para estéticas de cor
    scale_XXX_YYY()
      
      # methods for continuous colour gradients
      
        # a two-colour gradient, low-high. Arguments low = and high = control
        # the colours at either End of the gradient
        scale_colour_gradient(low = , high = )
        scale_fill_gradient(low = , high = )
        
        # a three-colour gradient, low-med-high. The midpoint defaults 
        # to 0, but can be set to any value with the midpoint argument. 
        # This is particularly useful for creating diverging colour schemes
        scale_colour_gradient2(low = , mid = , high = )
        scale_fill_gradient2(low = , mid = , high = )
        
        # a custom ncolour gradient. This scale requires a vector of colours
        # in the colours argument. Without further arguments these colours 
        # will be evenly spaced along the range of the data. If you want 
        # the values to be unequally spaced, use the values argument, 
        # which should be between 0 and 1 if rescale is true (the default), 
        # or within the range of the data is rescale is false
        scale_colour_gradientn()
        scale_fill_gradientn()
      
    
      # methods for discrete colour gradients
        
        # it picks evenly spaced hues around the hcl colour wheel. This 
        # works well for up to about eight colours, but after that it 
        # becomes hard to tell the different colours apart. All have
        # the same luminance and chroma
        scale_colour_hue() 
        
        # use the ColorBrewer colours. Use RColorBrewer::display.brewer.all() 
        # to list all palettes
        scale_colour_brewer(pal = )
        
    # ESCALAS PARA ESTÉTICAS DISCRETAS MANUAIS
    # Função scale_XXX_YYY() que determinam manualmente as escalas
    # para estéticas discretas
        
      # methods for discrete values
        
        # If you want to customise these scales, you need to create your 
        # own new scale with the manual scale. The manual scale has one
        # important argument, values, where you specify the values that 
        # the scale should produce.
        scale_shape_manual(value = )
        scale_linetype_manual(value = )
        scale_colour_manual(value = )
        
    # ESCALAS IDÊNTICAS
    # função scale_XXX_YYY() que não altera a escala padrão do dataset. This 
    # means there is no way to derive a meaningful legend from the data, 
    # and by default a legend is not drawn.  If you want one, you can 
    # still use the breaks and labels arguments to set it up yourself
        
        scale_identity()

#$COORDINATES
        
  # CARTESIAN
    
    # Setting limits
      
      # Any data outside the limits is not plotted and not included in the
      # statistical transformation. This means that setting the limits is not 
      # the same as visually zooming in to a region of the plot. To do that, 
      # you need to use the xlim and ylim arguments to coord_cartesian()
      coord_XXX(xlim = , ylim = )
      
    # Flipping the axes
      
      # If you are interested in x conditional on y (or you just want to
      # rotate the plot 90 degrees), you can use coord_flip to exchange
      # the x and y axes
      coord_XXX()
      
    # Transformation
      
      # It has the arguments x and y which should be strings naming the
      # transformer to use for that axis. Transforming at the coordinate 
      # system level occurs AFTER statistics are computed and does change
      # the shape of the geom Cartesian coordinate systems
      coord_XXX(x = , y = )
      
    # Equal scales
      
      # It ensures that the x and y axes have equal scales. By default 
      # it will assume that you want a one-to-one ratio, but you can
      # change this with the ratio parameter
      coord_XXX(ratio = )
      
  # NON-CARTESIAN
      
    # Polar coordinates
      
      # PIE CHARTS (from geom_bar)
      # The theta argument determines which position variable is mapped 
      # to angle (by default, x) and which to radius
      coord_XXX(theta = "y")
      
      # BULLSEYE CHART (from geom_bar)
      # The theta argument determines which position variable is mapped 
      # to angle (by default, x) and which to radius
      coord_XXX(theta = "x")
      
      # WIND ROSES (from geom_bar)
      # The theta argument determines which position variable is mapped 
      # to angle (by default, x) and which to radius
      coord_XXX(theta = )
      
      # RADAR CHARTS (from line geoms)
      # The theta argument determines which position variable is mapped 
      # to angle (by default, x) and which to radius
      coord_XXX(theta = )
      
    # Map projections
      
      # still in progress
        
#$FACET 
  
  # Faceting is a mechanism for automatically laying out multiple plots 
  # on a page. It splits the data into subsets, and then plots each subset 
  # into a different panel on the page. Such plots are often called small
  # multiples. There are two basic arguments to the faceting systems: 
  # the variables to facet by, and whether:
  
    # FACET GRID
    # produces a 2d grid of panels defined by variables which form 
    # the rows and columns. When specifying a faceting formula,
    # you specify which variables should appear in the columns and 
    # which should appear in the rows, as follows
    facet_grid()
    
      # ARGUMENTS

          # VARIABLES

              # Neither rows nor columns are faceted, so you get a single panel
              . ~ .
              
              # A single row with multiple columns
              . ~ b
              
              # A single column with multiple rows
              a ~ .
              
              #Multiple rows and columns
              a ~ b
              
              # Multiple variables in the rows or columns (or both)
              . ~ a + b
              a + b ~ .
              a + b ~ a + b
              
          #MARGINS
              
              # You can either specify that all margins should be 
              # Displayed, using 
              margins = TRUE
              
              # or by listing the names of the variables that you 
              # want margins for
              margins = c("sex", "age")
              
              # You can also use "grand_row" or "grand_col" to produce 
              # grand row and grand column margins, respectively
              grand_row =
              grand_col =
                
          # CONTROLLING SCALES
                
              # For both types of faceting you can control whether the 
              # position scales are the same in all panels (fixed) or 
              # allowed to vary between panels (free). This is controlled
              # by the scales parameter. There is an constraint on the 
              # scales of facet_grid: all panels in a column must have 
              # the same x scale, and all panels in a row must have the 
              # same y scale. This is because each column shares an x axis, 
              # and each row shares a y axis
                
                # x and y scales are fixed across all panels
                scales = "fixed"
                
                # x and y scales vary across panels
                scales = "free"
                
                # the x scale is free, and the y scale is fixed
                scales = "free_x"
                
                # the y scale is free, and the x scale is fixed
                scales = "free_y"
                
          # ESPAÇO
                
              # For facet_grid there is an additional parameter called 
              # space, which takes values "free" or "fixed"
                
                space = 
                  
    # FACET WRAP
    # produces a 1d ribbon of panels that is wrapped into 2d. There are 
    # two basic arguments to the faceting systems: the variables to facet
    # by, and whether position scales should be global or local to the facet
    facet_wrap()
      
      # ARGUMENTS
    
          # VARIABLES
  
              # The specification of faceting variables is of the form
              ~ a + b + c
              
          # NUMBER OF COLS E ROWS
  
              # it override the default by setting ncol, nrow or both
              ncol = 
              nrow =

          # CONTROLLING SCALES
                
              # For both types of faceting you can control whether the position
              # scales are the same in all panels (fixed) or allowed to vary 
              # between panels (free). This is controlled by the scales parameter
                
                # x and y scales are fixed across all panels
                scales = "fixed"
                
                # x and y scales vary across panels
                scales = "free"
                
                # the x scale is free, and the y scale is fixed
                scales = "free_x"
                
                # the y scale is free, and the x scale is fixed
                scales = "free_y"
  
#$THEME
  
  # The appearance of non-data elements of the plot is controlled by
  # the theme system. 
                
    # You can see the settings for the current theme with 
    theme_get()
    
    # You can modify the elements locally or globally for all future plots
    # with 
    theme_update()
                
                
  # It can apply themes in two ways:
                
    # GLOBALLY
    # It affect all plots when they are drawn
    theme_set(theme_XXX())
    
    # LOCALLY
    # applied theme will override the global default
    theme_XXX()
    
  # SET A BUILT-IN THEME
  theme_XXX(
    
    # Parameter base_size controls the base font size. The base font size 
    # is the size that the axis titles use: the plot title is 20% bigger, 
    # and the tick and strip labels are 20% smaller
    base_size = ,

    # The position and justification of legends are controlled by the 
    # theme setting. The value can be "right", "left", "top", "bottom", 
    # "none" (no legend), or a numeric position. The numeric position 
    # gives (in values between 0 and 1) the position of the corner 
    # given by legend.justification, a numeric vector of length two. 
    # Top right = c(1, 1), bottom left = c(0, 0)
    legend.position = )
  
  # BUILD A THEME
  theme()
  
    # ELEMENTS
    # A theme is made up of multiple elements which control the
    # appearance of a single item on the plot
  
      ?theme
      
    # FUNCTION ELEMENT
    # There are four basic types of built-in element functions
    
      # TEXT  
      # draws labels and headings. You can control the font family,
      # face, colour, size, hjust, vjust, angle and lineheight
      element_text()
      
      # LINE
      # draw lines and segments with the same options but in
      # a slightly different way
      element_line()
      
      # RECTANGLES
      # draws rectangles, mostly used for backgrounds
      element_rect()
      
      # BLANK
      # draws nothing
      element_blanck()
          
#$ANNOTATIONS
          
    annotatate()
    annotation_custom()
    annotation_logticks()
    annotation_map()
    annotation_raster()

    