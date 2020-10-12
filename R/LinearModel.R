#' A Random Linear Model
#'
#' This function returns a model which can be passed to renderText or renderTable if pre-processed appropriately
#'
#' @return a model
#'
#' @export
#'
random_lm <- function(nobs, nx){

  dataset <- shinipsum::random_table(nrow = nobs, ncol = nx, type = "numeric")

  x <- as.matrix(dataset[, -1])

  y <- dataset[, 1]

  lm(y~x)

}
