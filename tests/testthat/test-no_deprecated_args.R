test_that("random_ggplot('line') does not emit ggplot2 'size' deprecation (#13)", {
  # ggplot2 >= 3.4 deprecated size= for line geoms in favour of linewidth=.
  # lifecycle only warns once per call site per session, so force it on.
  old <- options(lifecycle_verbosity = "warning")
  on.exit(options(old), add = TRUE)

  # The warning fires when the plot is *constructed*, not when it is built,
  # so both have to sit inside the capture. Seeds 1 and 4 pick the two
  # geom_line() variants of type = "line". expect_no_warning() is no use
  # here: under testthat edition 2 it records the warning instead of failing.
  for (s in c(1L, 4L)) {
    set.seed(s)
    w <- capture_warnings(ggplot2::ggplot_build(random_ggplot("line")))
    expect_false(any(grepl("deprecated", w)))
  }
})
