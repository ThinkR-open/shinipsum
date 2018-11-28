#' Get a shinipsum example
#'
#' @param which The example to run. If empty, all the available examples are listed.
#'
#' @return A path to the example.
#' @export
#'
#' @examples
#' ipsum_examples()

ipsum_examples <- function(which = NULL){
  if (is.null(which)){
    list.files(
      system.file("examples", package = "shinipsum")
    )
  } else {
    normalizePath(
      file.path(
        system.file("examples", which, package = "shinipsum")
      )
    )
  }
}
