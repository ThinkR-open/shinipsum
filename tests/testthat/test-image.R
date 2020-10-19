test_that("ggplot creation works", {
  lapply(
    1:100, function(x){
      a <- random_image()
      expect_true(file.exists(a$src))
    }
  )
})
