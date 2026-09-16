#' A Random Lorem Ipsum
#'
#' @param nchars number of characters. One of the two params should be left NULL.
#' @param nwords number of words to return. One of the two params should be left NULL.
#' @param offset number of characters or words to offset the result by. Defaults to 0.
#' @param var integer >= 1 selecting a "variant" of the text: each value returns
#'   a distinct slice of the lorem-ipsum corpus, so repeated calls (e.g. in a
#'   bulleted list) don't all look alike. Defaults to 1. The corpus wraps around
#'   when `var` is large.
#'
#' @importFrom attempt stop_if_all stop_if_not
#'
#' @return a text
#'
#' @export

random_text <- function(nchars = NULL, nwords = NULL, offset = 0, var = 1){
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
  stop_if_not(
    var,
    ~ is.numeric(.x) && length(.x) == 1L && !is.na(.x) &&
      .x >= 1L && .x == as.integer(.x),
    "`var` must be a single integer >= 1"
  )

  if (!is.null(nchars)){
    total <- nchar(shinipsum::lorem)
    start <- (offset + (var - 1) * nchars) %% total
    res <- substr(
      paste0(shinipsum::lorem, shinipsum::lorem),
      1 + start,
      nchars + start
    )
  } else {
    n <- length(shinipsum::lorem_words)
    start <- (offset + (var - 1) * nwords) %% n
    idx <- ((start + seq_len(nwords) - 1L) %% n) + 1L
    res <- paste(shinipsum::lorem_words[idx], collapse = " ")
  }

  substr(res, 1, 1) <- toupper(substr(res, 1, 1))
  res
}

