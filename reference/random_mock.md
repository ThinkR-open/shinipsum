# A Mock UI Layout

Build a quick "zoning" of a Shiny UI: a row of bootstrap columns, each
one drawn as an empty bordered box with a centered label. Handy to
sketch the layout of an app before any real content exists.

## Usage

``` r
random_mock(widths, heights = 3, labels = NULL)
```

## Arguments

- widths:

  integer vector of bootstrap column widths (each between 1 and 12). Its
  length defines the number of mock zones.

- heights:

  integer vector giving the visual height of each zone, expressed as a
  number of blank lines. Recycled to the length of `widths`. Default 3.

- labels:

  character vector of zone labels. Recycled to the length of `widths`.
  When `NULL` (default), short random lorem-ipsum labels are used.

## Value

a
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)

## Details

The returned object is a
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
(a self-contained CSS `<style>` block plus the columns), so it can be
dropped directly inside a `shiny::fluidPage()` /
[`bslib::page_fluid()`](https://rstudio.github.io/bslib/reference/page.html)
and rendered as is.

## Examples

``` r
random_mock(c(4, 8))
#> <style>
#>     .shinipsum-mock {
#>       border: 2px solid #333;
#>       margin: 0.5em 0;
#>       padding: 0.5em;
#>       background: repeating-linear-gradient(
#>         45deg, #f6f6f6, #f6f6f6 10px, #efefef 10px, #efefef 20px
#>       );
#>     }
#>     .shinipsum-mock-label {
#>       text-align: center;
#>       font-weight: bold;
#>       margin: 0;
#>     }
#>   </style>
#> <div class="row">
#>   <div class="col-sm-4 shinipsum-mock">
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p class="shinipsum-mock-label">Lorem ipsum dolor</p>
#>   </div>
#>   <div class="col-sm-8 shinipsum-mock">
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p class="shinipsum-mock-label">Sit amet consectetur</p>
#>   </div>
#> </div>
random_mock(c(6, 6), labels = c("a plot here", "a table here"))
#> <style>
#>     .shinipsum-mock {
#>       border: 2px solid #333;
#>       margin: 0.5em 0;
#>       padding: 0.5em;
#>       background: repeating-linear-gradient(
#>         45deg, #f6f6f6, #f6f6f6 10px, #efefef 10px, #efefef 20px
#>       );
#>     }
#>     .shinipsum-mock-label {
#>       text-align: center;
#>       font-weight: bold;
#>       margin: 0;
#>     }
#>   </style>
#> <div class="row">
#>   <div class="col-sm-6 shinipsum-mock">
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p class="shinipsum-mock-label">a plot here</p>
#>   </div>
#>   <div class="col-sm-6 shinipsum-mock">
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p>&nbsp;</p>
#>     <p class="shinipsum-mock-label">a table here</p>
#>   </div>
#> </div>
```
