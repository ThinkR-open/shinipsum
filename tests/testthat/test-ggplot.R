test_that("ggplot creation works", {
  expected_length <- length(ggplot2::ggplot())
  lapply(
    1:100, function(x){
      a <- random_ggplot()
      expect_is(a, "gg")
      expect_is(a, "ggplot")
      expect_length(a, expected_length)
    }
  )

})

test_that("ggplotly creation works", {
  a <- random_ggplotly()
  expect_is(a, "plotly")
  expect_is(a, "htmlwidget")
  b <- random_ggplotly("ts")
  expect_is(b, "plotly")
})
