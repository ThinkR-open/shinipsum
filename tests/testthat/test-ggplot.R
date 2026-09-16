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
  # "tile" used to be listed twice, and switch() only ever matches the first
  # entry, so the 160/161 variants were unreachable.
  types <- eval(formals(random_ggplot)$type)
  expect_equal(anyDuplicated(types), 0L)
})
