# A Random ggplot

This function returns a ggplot object, which can be passed to
`renderPlot` and `plotOutput`

## Usage

``` r
random_ggplot(
  type = c("random", "point", "bar", "boxplot", "col", "tile", "line", "bin2d",
    "contour", "density", "density_2d", "dotplot", "hex", "freqpoly", "histogram",
    "ribbon", "raster", "violin", "ts"),
  n_bars = NULL
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

- n_bars:

  number of bars to draw. Only valid together with `type = "bar"`, and
  errors otherwise. When `NULL` (default) one of the built-in datasets
  is used instead.

## Value

a ggplot
