context("test-ggplot.R")

test_that("ggplot creation works", {
  lapply(
    1:100, function(x){
      a <- random_ggplot()
      expect_is(a, "gg")
      expect_is(a, "ggplot")
      expect_length(a, 9)
    }
  )

})
