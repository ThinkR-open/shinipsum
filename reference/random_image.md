# A Random Image

This function returns a random image that can be passed into
`renderImage` and `plotOutput`.

## Usage

``` r
random_image(width = NULL, height = NULL, alt = NULL)
```

## Arguments

- width:

  image width passed through to the rendered `<img>` tag. `NULL`
  (default) leaves the attribute unset (#9).

- height:

  image height, same semantics as `width` (#9).

- alt:

  `alt` attribute for accessibility. `NULL` (default) leaves the
  attribute unset (#9).

## Value

a list compatible with `shiny::renderImage()`: `src`, plus the `width` /
`height` / `alt` attributes when provided.
