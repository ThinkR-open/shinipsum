context("test-lm.R")

test_that("lm creation works", {
  lapply(
    50:100, function(x){
      a <- random_lm(x, 18)
      expect_is(a, "lm")
    }
  )

})
