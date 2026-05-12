# shinipsum 0.0.0.9000

* `random_ggplot()` gains a `"ts"` type (alias `"timeseries"`) returning a
  time-series oriented plot with a `Date` on the x axis (#4).
* New `random_mock()`: builds a quick "zoning" of a Shiny UI as a row of
  bordered, labelled bootstrap columns (#1).
* `random_text()` gains a `var` argument to get visually different slices of
  the lorem-ipsum corpus on repeated calls (#3).
* Fixed a `ggplot2` deprecation warning in `random_ggplot("line")`
  (`size` -> `linewidth`) (#13).
