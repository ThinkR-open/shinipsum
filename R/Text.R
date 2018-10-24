#' @importFrom attempt stop_if_all
#'
#' @export

random_text <- function(nchars = NULL, nwords = NULL){
  stop_if_all(
    c(nchars, nwords),
    is.null,
    "Please enter a nchars or nwords"
  )
  stop_if_all(
    list(nchars, nwords),
    ~ !is.null(.x),
    "You can't chose both nchars and nwords"
  )

  if (!is.null(nchars)){
    res <- substr(
      lorem,
      1,
      nchars
    )
  } else {
    res <- paste(lorem_words[1:nwords], collapse = " ")
  }
  res
}

