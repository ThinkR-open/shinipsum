#' A Random Image
#'
#' This function returns a random image that can be passed into `renderImage` and `plotOutput`.
#'
#' @param width image width passed through to the rendered `<img>` tag.
#'   `NULL` (default) leaves the attribute unset (#9).
#' @param height image height, same semantics as `width` (#9).
#' @param alt `alt` attribute for accessibility. `NULL` (default) leaves
#'   the attribute unset (#9).
#'
#' @return a list compatible with `shiny::renderImage()`: `src`, plus the
#'   `width` / `height` / `alt` attributes when provided.
#'
#' @export

random_image <- function(width = NULL, height = NULL, alt = NULL){
  l <- list.files(system.file("img", package = "shinipsum"), full.names = TRUE)
  img <- normalizePath(sample(l, 1))
  tmpimg <- paste(tempfile(), basename(img), sep = "-")
  file.copy(img, tmpimg)
  out <- list(src = tmpimg)
  if (!is.null(width))  out$width  <- width
  if (!is.null(height)) out$height <- height
  if (!is.null(alt))    out$alt    <- alt
  out
}
