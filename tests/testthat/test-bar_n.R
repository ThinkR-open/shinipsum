test_that("random_ggplot('bar', n_bars=) produces exactly n bars (#5)", {
  for (n in c(1L, 3L, 7L, 27L)) {
    p <- random_ggplot("bar", n_bars = n)
    expect_s3_class(p, "ggplot")
    # Build the plot and count distinct bars in the rendered data layer.
    built <- ggplot2::ggplot_build(p)
    bars <- nrow(built$data[[1]])
    expect_equal(bars, n,
      info = paste0("requested ", n, " bars, got ", bars))
  }
})

test_that("random_ggplot('bar') without n_bars keeps the legacy datasets behaviour", {
  withr::with_seed(1, {
    p <- random_ggplot("bar")
  })
  expect_s3_class(p, "ggplot")
})

test_that("random_ggplot rejects nonsense n_bars (#5)", {
  expect_error(random_ggplot("bar", n_bars = -1))
  expect_error(random_ggplot("bar", n_bars = "five"))
  expect_error(random_ggplot("bar", n_bars = c(3, 4)))
})
