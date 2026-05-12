context("test-mock.R")

test_that("random_mock returns a tagList of bootstrap columns", {
  m <- random_mock(c(4, 8))
  expect_is(m, "shiny.tag.list")
  html <- paste(as.character(m), collapse = "")
  expect_match(html, "col-sm-4")
  expect_match(html, "col-sm-8")
  expect_match(html, "shinipsum-mock")
  # one style block + two columns
  expect_equal(sum(grepl("col-sm-", strsplit(html, "<div")[[1]])), 2)
})

test_that("random_mock uses provided labels", {
  m <- random_mock(c(6, 6), labels = c("a graph here", "a table here"))
  html <- paste(as.character(m), collapse = "")
  expect_match(html, "a graph here")
  expect_match(html, "a table here")
})

test_that("random_mock recycles heights and labels", {
  m <- random_mock(c(3, 3, 3), heights = 2, labels = "x")
  html <- paste(as.character(m), collapse = "")
  expect_equal(lengths(regmatches(html, gregexpr("col-sm-3", html))), 3)
  expect_equal(lengths(regmatches(html, gregexpr(">x<", html))), 3)
  # 2 blank lines per column
  expect_equal(lengths(regmatches(html, gregexpr("&nbsp;", html))), 6)
})

test_that("random_mock generates labels when none supplied", {
  m <- random_mock(c(4, 4, 4))
  html <- paste(as.character(m), collapse = "")
  expect_match(html, "shinipsum-mock-label")
})

test_that("random_mock validates widths", {
  expect_error(random_mock("bad"), "widths")
  expect_error(random_mock(numeric(0)), "widths")
  expect_error(random_mock(c(4, 13)), "widths")
  expect_error(random_mock(c(0, 4)), "widths")
  expect_error(random_mock(c(4, 4.5)), "widths")
  expect_error(random_mock(c(4, NA)), "widths")
})
