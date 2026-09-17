# A Random Lorem Ipsum

A Random Lorem Ipsum

## Usage

``` r
random_text(nchars = NULL, nwords = NULL, offset = 0, var = 1)
```

## Arguments

- nchars:

  number of characters. One of the two params should be left NULL.

- nwords:

  number of words to return. One of the two params should be left NULL.

- offset:

  number of characters or words to offset the result by. Defaults to 0.

- var:

  integer \>= 1 selecting a "variant" of the text: each value returns a
  distinct slice of the lorem-ipsum corpus, so repeated calls (e.g. in a
  bulleted list) don't all look alike. Defaults to 1. The corpus wraps
  around when `var` is large.

## Value

a text
