context("test-ggplot-ts.R")

test_that("random_ggplot('ts') returns a time-series ggplot with a Date x", {
  lapply(
    1:50, function(x){
      a <- random_ggplot("ts")
      expect_is(a, "ggplot")
      expect_true("date" %in% names(a$data))
      expect_is(a$data$date, "Date")
      # building must not error nor warn (e.g. deprecated aesthetics)
      expect_warning(ggplot2::ggplot_build(a), regexp = NA)
    }
  )
})

test_that("'timeseries' is an alias of 'ts'", {
  a <- random_ggplot("timeseries")
  expect_is(a, "ggplot")
  expect_true("date" %in% names(a$data))
  expect_is(a$data$date, "Date")
})

test_that("'ts' is part of the random pool", {
  expect_true("ts" %in% eval(formals(random_ggplot)$type))
})
