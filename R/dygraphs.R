#' A Random Dygraph
#'
#' This function returns a dygraph object, which can be passed to `renderDygraph` and `dygraphOutput`
#'
#' @param ... args passed to `dygraph`
#' @importFrom dygraphs dygraph
#' @importFrom stats HoltWinters predict
#' @return a dygraph
#' @export

random_dygraph <- function(...){

  switch (as.character(sample(1:5, 1)),
    "1" = dygraph(cbind(datasets::mdeaths, datasets::fdeaths), ...),
    "2" = dygraph(
      predict(HoltWinters(datasets::ldeaths), n.ahead = 72, prediction.interval = TRUE),
      ...
      ),
    "3" = dygraph(datasets::nhtemp, ...),
    "4" = dygraph(datasets::AirPassengers, ...),
    "5" = dygraph(datasets::discoveries, ...),
    "6" = dygraph(datasets::presidents, ...),
    "7" = dygraph(datasets::austres, ...)
  )
}
