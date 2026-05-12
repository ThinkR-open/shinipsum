context("test-text-var.R")

test_that("var = 1 is the historical behaviour", {
  expect_identical(random_text(nwords = 12), random_text(nwords = 12, var = 1))
  expect_identical(random_text(nchars = 40), random_text(nchars = 40, var = 1))
  expect_identical(
    random_text(nwords = 12, offset = 20),
    random_text(nwords = 12, offset = 20, var = 1)
  )
})

test_that("different var values give different text", {
  a <- random_text(nwords = 10, var = 1)
  b <- random_text(nwords = 10, var = 2)
  cc <- random_text(nwords = 10, var = 3)
  expect_false(a == b)
  expect_false(b == cc)
  expect_false(a == cc)

  a2 <- random_text(nchars = 30, var = 1)
  b2 <- random_text(nchars = 30, var = 2)
  expect_false(a2 == b2)
})

test_that("var keeps the requested size", {
  for (v in c(1, 2, 5, 50)) {
    expect_equal(nchar(random_text(nchars = 25, var = v)), 25)
  }
  # var > 1 returns exactly `nwords` words
  for (v in c(2, 5, 1e6)) {
    expect_equal(
      length(strsplit(random_text(nwords = 10, var = v), " ")[[1]]),
      10
    )
  }
  # very large var wraps around the corpus instead of producing NA / short text
  big <- random_text(nchars = 20, var = 1e6)
  expect_equal(nchar(big), 20)
  expect_false(grepl("NA", random_text(nwords = 8, var = 1e6)))
})

test_that("var combines with offset", {
  expect_false(
    random_text(nwords = 8, offset = 5, var = 2) ==
      random_text(nwords = 8, offset = 5, var = 1)
  )
})

test_that("var is validated", {
  expect_error(random_text(nwords = 5, var = 0), "var")
  expect_error(random_text(nwords = 5, var = -1), "var")
  expect_error(random_text(nwords = 5, var = 1.5), "var")
  expect_error(random_text(nwords = 5, var = c(1, 2)), "var")
  expect_error(random_text(nwords = 5, var = NA), "var")
  expect_error(random_text(nwords = 5, var = "a"), "var")
})
