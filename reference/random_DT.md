# A Random DT

This function creates a random DT::datatable, and can be passed into
`renderDT` & `DTOutput`.

## Usage

``` r
random_DT(
  nrow,
  ncol,
  type = c("random", "numeric", "character", "numchar"),
  ...
)
```

## Arguments

- nrow:

  number of row of the output

- ncol:

  number of cols of the output

- type:

  type of the columns, can be "random", "numeric", "character",
  "numchar". Default is random.

- ...:

  arguments to be passed to DT::datatable

## Value

a DT
