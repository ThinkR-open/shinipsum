context("test-dt.R")

expect_ncol <- function(a, b){
  expect_equal(
    ncol(a) - 1,
    b
  )
}
expect_nrow <- function(a, b){
  expect_equal(
    nrow(a),
    b
  )
}

test_that("DT works", {
  a <- random_DT(10, 15)
  expect_nrow(a$x$data, 10)
  expect_ncol(a$x$data, 15)
})
