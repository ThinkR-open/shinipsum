# shinipsum 0.1.1.9000

* New `random_mock()`: sketches the zoning of a Shiny UI as a row of bordered,
  labelled bootstrap columns, returned as a `htmltools::tagList()` (#1).
* `random_text()` gains a `var` argument: each integer value returns a
  distinct slice of the corpus, so repeated calls don't all look alike.
  `var = 1` (the default) is unchanged (#3).
* `random_ggplot()` gains a `"ts"` type (alias `"timeseries"`) returning a
  time-series oriented plot with a `Date` on the x axis, and takes part in the
  `"random"` draw (#4).
* `random_ggplot("tile")` can now return all four of its variants. `"tile"`
  was listed twice in `type`, and `switch()` only matches the first entry, so
  two of them were unreachable.
* `random_text(nwords =)` now returns exactly `nwords` words. `offset` was
  parsed as `1 + (offset:nwords) + offset`, so both the number of words and
  the order of the slice depended on `offset` (e.g. `nwords = 3, offset = 10`
  returned 8 words, in reverse). This changes the output of every
  `random_text(nwords =)` call.
* New `random_image_ext()`: returns an `<img>` tag pointing at the
  [Lorem Picsum](https://picsum.photos/) API, with `width` / `height` / `seed`
  arguments, for quick Shiny UI prototyping (#8, thanks @feddelegrand7).
* `random_image()` gains `width`, `height` and `alt` arguments, added to the
  returned list only when set (#9).
* `random_ggplot("line")` no longer emits ggplot2's `size` -> `linewidth`
  deprecation warning (#13).

# shinipsum 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
