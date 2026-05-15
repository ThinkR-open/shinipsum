#' A Random Linear Model
#'
#' This function returns a model which can be passed to renderText or renderTable if pre-processed appropriately
#'
#' @param nobs Numeric. number of observation
#' @param nx Numeric. number of variables. Should be lower that nobs
#' @return a model output
#'
#' @export
#'
random_lm <- function(nobs = 100, nx = 2){

  try(if(nobs < nx) stop("Less observations than variables"))

  x <- rnorm(nobs*(nx - 1))

  x <- cbind(1, matrix(x, nobs, (nx-1)))

  coefficients <- sample(1:nobs, nx)

  y <- c(coefficients%*%t(x)) + rnorm(nobs)

  lm(y ~ x - 1)


}
