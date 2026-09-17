# A Random ggplot

This function returns a ggplot object, which can be passed to
`renderPlot` and `plotOutput`

## Usage

``` r
random_ggplot(
  type = c("random", "point", "bar", "boxplot", "col", "tile", "line", "bin2d",
    "contour", "density", "density_2d", "dotplot", "hex", "freqpoly", "histogram",
    "ribbon", "raster", "violin", "ts")
)
```

## Arguments

- type:

  type of the geom. Can be any of "random", "point", "bar",
  "boxplot","col", "tile", "line", "bin2d", "contour", "density",
  "density_2d", "dotplot", "hex", "freqpoly", "histogram", "ribbon",
  "raster", "violin", "ts" (alias "timeseries") and defines the geom of
  the ggplot. Default is "random", and chooses a random geom for you.
  The "ts" type returns a time-series oriented plot, with a `Date` on
  the x axis.

## Value

a ggplot
