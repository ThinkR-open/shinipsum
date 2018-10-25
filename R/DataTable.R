#' A Random DT
#'
#' This function creates a random DT::datatable, and can be passed into `renderDT` & `DTOutput`.
#'
#' @param nrow number of row of the output
#' @param ncol number of cols of the output
#' @param type type of the columns, can be "random", "numeric", "character", "numchar". Default is random.
#' @param ... arguments to be passed to DT::datatable
#'
#' @return a DT
#'
#' @importFrom DT datatable
#' @export
#'


random_DT <- function(nrow, ncol,
                      type = c("random", "numeric",
                               "character", "numchar"),
                      ...){
  type <- match.arg(type)
  random_table(nrow, ncol, type) %>%
    datatable(...)
}
