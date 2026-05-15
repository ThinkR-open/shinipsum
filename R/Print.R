#' A Random print output
#'
#' This function returns a random print output that can be passed to `renderPrint` and `verbatimTextOutput`.
#'
#' @param type type of the output ("character", "numeric", "model", "table")
#'
#' @importFrom stats lm cor.test shapiro.test rnorm
#'
#' @return a random print
#' @export
#'

random_print <- function(type = c("character", "numeric", "integer", "model", "table")) {
  type <- match.arg(type)
  res <- switch (type,
    "character" = list("foo", "bar", random_text(nwords = sample(1:60, 1))),
    "integer" = list(1:10, 1:100, 1:50),
    "numeric" = list(as.numeric(1:10), as.numeric(1:100), rnorm(10), pi),
    "model" = list(
        lm(Sepal.Length ~ Sepal.Width, data = datasets::iris),
        cor.test(datasets::mtcars$mpg, datasets::mtcars$cyl),
        shapiro.test(datasets::airquality$Ozone)),
    "table" = list(datasets::iris, datasets::mtcars, datasets::airquality)
    )
  sample(res, 1)[[1]]
}
