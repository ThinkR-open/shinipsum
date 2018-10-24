context("test-ggplot.R")

test_that("ggplot creation works", {
  a <- random_ggplot("col")
  expect_is(a, "gg")
  expect_is(a, "ggplot")
  expect_length(a, 9)
})
