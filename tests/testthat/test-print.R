context("test-print.R")

test_that("print works", {
  expect_is(random_print(), "character")
  expect_is(random_print("numeric"), "integer")
  expect_is(random_print("table"), "data.frame")
})
