#' A Random Lorem Ipsum
#'
#' @param nchars number of characters. One of the two params should be left NULL.
#' @param nwords number of words to return. One of the two params should be left NULL.
#' @param offset number of characters or words to offset the result by. Defaults to 0.
#' @param var integer >= 1 selecting a "variant" of the text: `var = 1` (the
#'   default) returns the historical result, while higher values return distinct
#'   slices of the lorem-ipsum corpus. Handy to get visually different chunks
#'   when calling `random_text()` repeatedly (e.g. in a bulleted list). The
#'   corpus wraps around when `var` is large.
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
    "You can't choose both nchars and nwords"
  )
  stop_if_not(
    var,
    ~ is.numeric(.x) && length(.x) == 1L && !is.na(.x) &&
      .x >= 1L && .x == as.integer(.x),
    "`var` must be a single integer >= 1"
  )
  var <- as.integer(var)

  if (!is.null(nchars)){
    if (var == 1L) {
      res <- substr(
        shinipsum::lorem,
        1 + offset,
        nchars + offset
      )
    } else {
      total <- nchar(shinipsum::lorem)
      start <- (offset + (var - 1L) * nchars) %% total
      doubled <- paste0(shinipsum::lorem, shinipsum::lorem)
      res <- substr(doubled, 1 + start, nchars + start)
    }
  } else {
    if (var == 1L) {
      res <- paste(shinipsum::lorem_words[1+offset:nwords+offset], collapse = " ")
    } else {
      n <- length(shinipsum::lorem_words)
      start <- (offset + (var - 1L) * nwords) %% n
      idx <- ((start + seq.int(0L, nwords)) %% n) + 1L
      res <- paste(shinipsum::lorem_words[idx], collapse = " ")
    }
  }

  substr(res, 1, 1) <- toupper(substr(res, 1, 1))
  res
}
