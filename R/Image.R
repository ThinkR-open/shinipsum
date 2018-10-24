#' @export

random_image <- function(){
  l <- list.files(system.file("img", package = "shinipsum"), full.names = TRUE)
  img <- normalizePath(sample(l, 1))
  tmpimg <- tempfile()
  file.copy(img, tmpimg)
  list(src = tmpimg)
}
