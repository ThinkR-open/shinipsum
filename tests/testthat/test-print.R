context("test-print.R")

test_that("print works", {
  lapply(
    1:100, function(x){
      expect_is(random_print(), "character")
      expect_is(random_print("numeric"), "numeric")
      expect_is(random_print("integer"), "integer")
      expect_is(random_print("table"), "data.frame")
    }
  )
})
