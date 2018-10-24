context("test-random.R")

expect_ncol <- function(a, b){
  expect_equal(
    ncol(a),
    b
  )
}
expect_nrow <- function(a, b){
  expect_equal(
    nrow(a),
    b
  )
}

test_that("random works", {
  expect_length(vec_ipsum(10), 10)
  expect_length(vec_ipsum(100), 100)
  expect_nrow(random_ipsum(10, 10), 10)
  expect_nrow(random_ipsum(100, 10), 100)
  expect_ncol(random_ipsum(10, 10), 10)
  expect_ncol(random_ipsum(10, 100), 100)
})
