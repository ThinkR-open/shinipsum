context("test-text.R")

expect_nchar <- function(a, b){
  expect_equal(
    nchar(a),
    b
  )
}

test_that("nchar works", {
  lapply(
    1:100, function(x){
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
        86
      )
      expect_nchar(
        random_text(nwords = 100),
        650
      )
      expect_nchar(
        random_text(nwords = 800),
        5244
      )
    })
})

test_that("offset works", {
  lapply(
    1:100, function(x){
      expect_nchar(
        random_text(nchars = 10, offset = 10),
        10
      )
      expect_nchar(
        random_text(nchars = 100, offset = 20),
        100
      )
      expect_nchar(
        random_text(nchars = 42, offset = 20),
        42
      )

      expect_nchar(
        random_text(nwords = 12, offset = 20),
        51
      )
      expect_nchar(
        random_text(nwords = 100, offset = 20),
        526
      )
      expect_nchar(
        random_text(nwords = 800, offset = 20),
        5105
      )
    })
})
