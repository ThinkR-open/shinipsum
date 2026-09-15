# A Random Table

This function returns a table that can be passed to `renderTable` and
`tableOutput`.

## Usage

``` r
random_table(nrow, ncol, type = c("random", "numeric", "character", "numchar"))
```

## Arguments

- nrow:

  number of row of the output

- ncol:

  number of cols of the output

- type:

  type of the columns, can be "random", "numeric", "character",
  "numchar". Default is random.

## Value

a table
