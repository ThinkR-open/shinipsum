examples_shinipsum <- list.files(
  system.file("examples", package = "shinipsum")
)

test_that("ggplot creation works", {
  expect_equal(ipsum_examples(), examples_shinipsum)
})
