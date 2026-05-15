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
