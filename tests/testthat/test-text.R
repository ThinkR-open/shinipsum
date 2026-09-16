context("test-text.R")

expect_nchar <- function(a, b){
  expect_equal(
    nchar(a),
    b
  )
}

expect_nwords <- function(a, b){
  expect_equal(
    length(strsplit(a, " ")[[1]]),
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

      expect_nwords(
        random_text(nwords = 12),
        12
      )
      expect_nwords(
        random_text(nwords = 100),
        100
      )
      expect_nwords(
        random_text(nwords = 800),
        800
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

      expect_nwords(
        random_text(nwords = 12, offset = 20),
        12
      )
      expect_nwords(
        random_text(nwords = 100, offset = 20),
        100
      )
      expect_nwords(
        random_text(nwords = 800, offset = 20),
        800
      )
    })
})

test_that("offset slides the word window by exactly one word", {
  # `1+offset:nwords+offset` used to parse as `1 + (offset:nwords) + offset`,
  # so both the length and the direction of the slice depended on offset.
  words <- strsplit(random_text(nwords = 5, offset = 0), " ")[[1]]
  for (o in 0:4) {
    expect_equal(
      tolower(strsplit(random_text(nwords = 5 - o, offset = o), " ")[[1]]),
      tolower(words[seq(o + 1, 5)])
    )
  }
})
