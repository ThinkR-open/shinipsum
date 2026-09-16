test_that("random_image() returns just `src` by default (regression)", {
  res <- random_image()
  expect_type(res, "list")
  expect_named(res, "src")
  expect_true(file.exists(res$src))
})

test_that("random_image(width=, height=, alt=) propagates the arguments (#9)", {
  res <- random_image(width = "100px", height = "80px", alt = "Yo")
  expect_named(res, c("src", "width", "height", "alt"))
  expect_equal(res$width, "100px")
  expect_equal(res$height, "80px")
  expect_equal(res$alt, "Yo")
})

test_that("random_image() drops NULL extras (#9)", {
  res <- random_image(width = "200px")
  expect_named(res, c("src", "width"))
  expect_equal(res$width, "200px")
})
