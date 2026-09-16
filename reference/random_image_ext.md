# A Random External Image from the Lorem Picsum API

Returns an `<img>` tag pointing at a random image served by the [Lorem
Picsum](https://picsum.photos/) API, ready to be dropped inside a Shiny
UI for quick prototyping. No network request is performed by this
function: only the URL is built, the image is fetched by the browser.

## Usage

``` r
random_image_ext(width = 400, height = 400, seed = NULL)
```

## Arguments

- width, height:

  image dimensions, in pixels. Single positive (finite, whole) numbers.

- seed:

  optional seed making the picked image stable across calls. Any atomic
  scalar; it is coerced to a string and URL-encoded. When `NULL`
  (default), a fresh random image is served on every request.

## Value

an `<img>`
[htmltools::tag](https://rstudio.github.io/htmltools/reference/builder.html)

## Examples

``` r
random_image_ext()
#> <img src="https://picsum.photos/400/400"/>
random_image_ext(width = 400, height = 600, seed = "caramba")
#> <img src="https://picsum.photos/seed/caramba/400/600"/>
```
