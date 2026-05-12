context("test-image-ext.R")

test_that("random_image_ext returns an <img> tag pointing at picsum", {
  i <- random_image_ext()
  expect_is(i, "shiny.tag")
  expect_equal(i$name, "img")
  expect_equal(i$attribs$src, "https://picsum.photos/400/400")
})

test_that("width and height go into the URL", {
  expect_equal(
    random_image_ext(width = 200, height = 300)$attribs$src,
    "https://picsum.photos/200/300"
  )
})

test_that("seed is included and URL-encoded", {
  expect_equal(
    random_image_ext(seed = "caramba")$attribs$src,
    "https://picsum.photos/seed/caramba/400/400"
  )
  expect_equal(
    random_image_ext(width = 100, height = 150, seed = "a b/c")$attribs$src,
    "https://picsum.photos/seed/a%20b%2Fc/100/150"
  )
})

test_that("width / height are validated", {
  expect_error(random_image_ext(width = 0), "width")
  expect_error(random_image_ext(width = -10), "width")
  expect_error(random_image_ext(width = 1.5), "width")
  expect_error(random_image_ext(width = c(100, 200)), "width")
  expect_error(random_image_ext(width = NA), "width")
  expect_error(random_image_ext(width = "100"), "width")
  expect_error(random_image_ext(height = 0), "height")
  expect_error(random_image_ext(height = "x"), "height")
  # tricky numerics fail with the friendly message, not a low-level error
  expect_error(random_image_ext(width = Inf), "width")
  expect_error(random_image_ext(width = NaN), "width")
  expect_error(random_image_ext(width = 1e400), "width")
  expect_error(random_image_ext(width = 1 + 0i), "width")
  expect_error(random_image_ext(width = TRUE), "width")
})

test_that("seed is validated", {
  expect_error(random_image_ext(seed = c("a", "b")), "seed")
  expect_error(random_image_ext(seed = NA), "seed")
  expect_error(random_image_ext(seed = character(0)), "seed")
  expect_error(random_image_ext(seed = list("a")), "seed")
  # numeric / other atomic scalars are coerced to character
  expect_equal(
    random_image_ext(seed = 42)$attribs$src,
    "https://picsum.photos/seed/42/400/400"
  )
  expect_equal(
    random_image_ext(seed = TRUE)$attribs$src,
    "https://picsum.photos/seed/TRUE/400/400"
  )
})
