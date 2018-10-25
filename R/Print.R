#' A Random print output
#'
#' This function returns a random print output that can be passed to `renderPrint` and `verbatimTextOutput`.
#'
#' @param type type of the output ("character", "numeric", "model", "table")
#'
#' @return a random print
#' @export
#'

random_print <- function(type = c("character", "numeric", "model", "table")) {
  type <- match.arg(type)
  res <- switch (type,
    "character" = list("foo", "bar", random_text(nwords = sample(1:60, 1))),
    "numeric" = list(1:10, 1:100, 1:50, pi),
    "model" = list(
        lm(Sepal.Length ~ Sepal.Width, data = iris),
        cor.test(mtcars$mpg, mtcars$cyl),
        shapiro.test(airquality$Ozone)),
    "table" = list(iris, mtcars, airquality)
    )
  sample(res, 1)[[1]]
}
