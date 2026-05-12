#' A Random External Image from the Lorem Picsum API
#'
#' Returns an `<img>` tag pointing at a random image served by the
#' [Lorem Picsum](https://picsum.photos/) API, ready to be dropped inside a
#' Shiny UI for quick prototyping. No network request is performed by this
#' function: only the URL is built, the image is fetched by the browser.
#'
#' @param width,height image dimensions, in pixels. Single positive integers.
#' @param seed optional seed making the picked image stable across calls. Any
#'   scalar; it is coerced to a string and URL-encoded. When `NULL` (default), a
#'   fresh random image is served on every request.
#'
#' @importFrom htmltools img
#' @importFrom attempt stop_if_not
#' @importFrom utils URLencode
#'
#' @return an `<img>` [htmltools::tag][htmltools::tags]
#'
#' @export
#'
#' @examples
#' random_image_ext()
#' random_image_ext(width = 400, height = 600, seed = "caramba")
random_image_ext <- function(width = 400, height = 400, seed = NULL) {
  valid_dim <- function(.x) {
    is.numeric(.x) && length(.x) == 1L && !is.na(.x) &&
      .x >= 1L && .x == as.integer(.x)
  }
  stop_if_not(width, valid_dim, "`width` must be a single positive integer")
  stop_if_not(height, valid_dim, "`height` must be a single positive integer")

  if (is.null(seed)) {
    src <- sprintf(
      "https://picsum.photos/%d/%d",
      as.integer(width), as.integer(height)
    )
  } else {
    stop_if_not(
      seed,
      ~ length(.x) == 1L && !is.na(.x),
      "`seed` must be a single non-missing value (or NULL)"
    )
    src <- sprintf(
      "https://picsum.photos/seed/%s/%d/%d",
      URLencode(as.character(seed), reserved = TRUE),
      as.integer(width), as.integer(height)
    )
  }

  img(src = src)
}
