# A Random ggplot

This function returns a ggplot object, which can be passed to
`renderPlot` and `plotOutput`

## Usage

``` r
random_ggplot(
  type = c("random", "point", "bar", "boxplot", "col", "tile", "line", "bin2d",
    "contour", "density", "density_2d", "dotplot", "hex", "freqpoly", "histogram",
    "ribbon", "raster", "tile", "violin")
)
```

## Arguments

- type:

  type of the geom. Can be any of "random", "point", "bar",
  "boxplot","col", "tile", "line", "bin2d", "contour", "density",
  "density_2d", "dotplot", "hex", "freqpoly", "histogram", "ribbon",
  "raster", "tile", "violin" and defines the geom of the ggplot. Default
  is "random", and chooses a random geom for you.

## Value

a ggplot
