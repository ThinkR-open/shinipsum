#' A Random External Image from the Lorem Picsum API
#'
#' This function returns an external random image from the Lorem Picsum API that can be used directly within the Shiny UI.
#'
#' @return an external image
#'
#' @export
#'
#' @examples
#'
#' random_image_ext(width = 400, height = 600, seed = "caramba")
#'
#'

random_image_ext <- function(width = 400, height = 400, seed = NULL) {

  if (is.null(seed)) {

    htmltools::img(src = glue::glue("https://picsum.photos/{width}/{height}"))

  } else {

    htmltools::img(src = glue::glue("https://picsum.photos/seed/{seed}/{width}/{height}"))

  }


}
