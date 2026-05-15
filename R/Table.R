#' A Random Table
#'
#' This function returns a table that can be passed to `renderTable` and `tableOutput`.
#'
#' @inheritParams random_DT
#'
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
                 datasets::iris, datasets::ability.cov$cov, datasets::anscombe,
                 datasets::attitude, datasets::beaver1, datasets::CO2, datasets::esoph,
                 datasets::longley, datasets::mtcars,
                 datasets::Puromycin
               ),
               "numchar" = list(
                 datasets::iris, datasets::CO2, datasets::esoph,
                 datasets::InsectSprays, datasets::OrchardSprays,
                 datasets::Puromycin, datasets::ToothGrowth
               ),
               "numeric" = list(
                 datasets::iris, datasets::ability.cov$cov, datasets::anscombe,
                 datasets::attitude, datasets::beaver1, datasets::longley, datasets::mtcars
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
