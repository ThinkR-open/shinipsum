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

test_that("the 'type' choices have no duplicates", {
  types <- eval(formals(random_ggplot)$type)
  expect_equal(anyDuplicated(types), 0L)
})

test_that("ggplotly creation works", {
  # use explicit types that don't pull optional packages (MASS / hexbin),
  # so the test stays deterministic on minimal CI images
  for (type in c("point", "line", "bar", "ts")) {
    a <- random_ggplotly(type)
    expect_is(a, "plotly")
    expect_is(a, "htmlwidget")
  }
})
