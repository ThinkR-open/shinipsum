context("test-dygraph")

test_that("dygraph creation works", {
  lapply(
    1:100, function(x){
      a <- random_dygraph()
      expect_is(a, "dygraphs")
      expect_is(a, "htmlwidget")
      expect_length(a, 8)
    }
  )
})

