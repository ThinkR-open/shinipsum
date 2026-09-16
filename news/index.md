# Changelog

## shinipsum 0.1.1.9000

- `random_text(nwords =)` now returns exactly `nwords` words. `offset`
  was parsed as `1 + (offset:nwords) + offset`, so both the number of
  words and the order of the slice depended on `offset`
  (e.g. `nwords = 3, offset = 10` returned 8 words, in reverse). This
  changes the output of every `random_text(nwords =)` call.
- New
  [`random_image_ext()`](https://thinkr-open.github.io/shinipsum/reference/random_image_ext.md):
  returns an `<img>` tag pointing at the [Lorem
  Picsum](https://picsum.photos/) API, with `width` / `height` / `seed`
  arguments, for quick Shiny UI prototyping
  ([\#8](https://github.com/Thinkr-open/shinipsum/issues/8), thanks
  [@feddelegrand7](https://github.com/feddelegrand7)).
- [`random_image()`](https://thinkr-open.github.io/shinipsum/reference/random_image.md)
  gains `width`, `height` and `alt` arguments, added to the returned
  list only when set
  ([\#9](https://github.com/Thinkr-open/shinipsum/issues/9)).
- `random_ggplot("line")` no longer emits ggplot2’s `size` -\>
  `linewidth` deprecation warning
  ([\#13](https://github.com/Thinkr-open/shinipsum/issues/13)).

## shinipsum 0.0.0.9000

- Added a `NEWS.md` file to track changes to the package.
