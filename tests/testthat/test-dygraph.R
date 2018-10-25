context("test-dygraph")

test_that("dygraph creation works", {
  a <- random_dygraph()
  expect_is(a, "dygraphs")
  expect_is(a, "htmlwidget")
  expect_length(a, 8)
})

