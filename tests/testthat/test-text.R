context("test-text.R")

expect_nchar <- function(a, b){
  expect_equal(
    nchar(a),
    b
  )
}

test_that("multiplication works", {
  expect_nchar(
    random_text(nchars = 10),
    10
  )
  expect_nchar(
    random_text(nchars = 100),
    100
  )
  expect_nchar(
    random_text(nchars = 42),
    42
  )

  expect_nchar(
    random_text(nwords = 12),
    83
  )
  expect_nchar(
    random_text(nwords = 100),
    643
  )
  expect_nchar(
    random_text(nwords = 800),
    5239
  )
})
