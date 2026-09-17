test_that("random_ggplot('bar', n_bars=) produces exactly n bars (#5)", {
  for (n in c(1L, 3L, 7L, 26L, 27L)) {
    p <- random_ggplot("bar", n_bars = n)
    expect_s3_class(p, "ggplot")
    expect_equal(nrow(ggplot2::ggplot_build(p)$data[[1]]), n)
  }
})

test_that("n_bars is rejected with any other type (#5)", {
  # including the default type = "random": silently dropping n_bars there
  # would leave it working only when the draw happens to land on "bar".
  expect_error(random_ggplot(n_bars = 5), "bar")
  expect_error(random_ggplot("point", n_bars = 5), "bar")
  expect_error(random_ggplot("ts", n_bars = 5), "bar")
})

test_that("random_ggplot rejects nonsense n_bars (#5)", {
  for (bad in list(-1, 0, 1.5, c(3, 4), NA, "five", Inf, NaN, TRUE)) {
    expect_error(random_ggplot("bar", n_bars = bad), "n_bars")
  }
})

test_that("random_ggplot('bar') without n_bars keeps the datasets behaviour", {
  expect_s3_class(random_ggplot("bar"), "ggplot")
})
