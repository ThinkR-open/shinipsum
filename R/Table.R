#' A Random Table
#'
#' This function returns a table that can be passed to `renderTable` and `tableOutput`.
#'
#' @inheritParams random_DT
#'
#' @return a table
#'
#' @export
#'
random_table <- function(nrow, ncol,
                         type = c("random", "numeric",
                                  "character", "numchar")){
  type <- match.arg(type)
  l <- switch (type,
               "random" = list(
                 iris, ability.cov$cov, anscombe,
                 attitude, beaver1, CO2, esoph, longley, mtcars,
                 Puromycin
               ),
               "numchar" = list(
                 iris, CO2, esoph, InsectSprays, OrchardSprays,
                 Puromycin, ToothGrowth
               ),
               "numeric" = list(
                 iris, ability.cov$cov, anscombe,
                 attitude, beaver1, longley, mtcars
               ),
               "character" = list(
                 random_ipsum(nrow, ncol)
               )
  )
  df <- sample(l, 1)[[1]]
  ncol(df)
  while (ncol(df) < 1){
    df <- sample(l, 1)[[1]]
  }
  while(ncol(df) < ncol){
    df <- cbind(df, df)
  }
  while(nrow(df) < nrow){
    df <- rbind(df, df)
  }
  df[1:nrow, 1:ncol]
}
