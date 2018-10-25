#' A Random Dygraph
#'
#' This function returns a dygraph object, which can be passed to `renderDygraph` and `dygraphOutput`
#'
#' @param ... args passed to `dygraph`
#' @importFrom dygraphs dygraph
#' @return a dygraph
#' @export

random_dygraph <- function(...){

  switch (as.character(sample(1:5, 1)),
    "1" = dygraph(cbind(mdeaths, fdeaths), ...),
    "2" = dygraph(
      predict(HoltWinters(ldeaths), n.ahead = 72, prediction.interval = TRUE),
      ...
      ),
    "3" = dygraph(nhtemp, ...),
    "4" = dygraph(AirPassengers, ...),
    "5" = dygraph(discoveries, ...),
    "6" = dygraph(presidents, ...),
    "6" = dygraph(presidents, ...),
    "7" = dygraph(austres, ...)
  )
}
