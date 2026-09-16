# shinipsum 0.1.1.9000

* New `random_image_ext()`: returns an `<img>` tag pointing at the
  [Lorem Picsum](https://picsum.photos/) API, with `width` / `height` / `seed`
  arguments, for quick Shiny UI prototyping (#8, thanks @feddelegrand7).
* `random_image()` gains `width`, `height` and `alt` arguments, added to the
  returned list only when set (#9).
* `random_ggplot("line")` no longer emits ggplot2's `size` -> `linewidth`
  deprecation warning (#13).

# shinipsum 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
