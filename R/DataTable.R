#' @importFrom DT datatable
#' @export

random_DT <- function(nrow, ncol,
                      type = c("random", "numeric",
                               "character", "numchar"),
                      ...){
  type <- match.arg(type)
  random_table(nrow, ncol, type) %>%
    datatable(...)
}
