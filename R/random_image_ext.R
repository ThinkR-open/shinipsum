#' A Random External Image from the Lorem Picsum API
#'
#' Returns an `<img>` tag pointing at a random image served by the
#' [Lorem Picsum](https://picsum.photos/) API, ready to be dropped inside a
#' Shiny UI for quick prototyping. No network request is performed by this
#' function: only the URL is built, the image is fetched by the browser.
#'
#' @param width,height image dimensions, in pixels. Single positive
#'   (finite, whole) numbers.
#' @param seed optional seed making the picked image stable across calls. Any
#'   atomic scalar; it is coerced to a string and URL-encoded. When `NULL`
#'   (default), a fresh random image is served on every request.
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
    is.numeric(.x) && length(.x) == 1L && is.finite(.x) &&
      .x >= 1 && .x == round(.x)
  }
  stop_if_not(width, valid_dim, "`width` must be a single positive integer")
  stop_if_not(height, valid_dim, "`height` must be a single positive integer")

  if (is.null(seed)) {
    src <- sprintf("https://picsum.photos/%.0f/%.0f", width, height)
  } else {
    stop_if_not(
      seed,
      ~ is.atomic(.x) && length(.x) == 1L && !is.na(.x),
      "`seed` must be a single non-missing atomic value (or NULL)"
    )
    src <- sprintf(
      "https://picsum.photos/seed/%s/%.0f/%.0f",
      URLencode(as.character(seed), reserved = TRUE),
      width, height
    )
  }

  img(src = src)
}
