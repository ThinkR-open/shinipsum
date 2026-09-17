vec_ipsum <- function(x) {
  sample(shinipsum::lorem_words, x)
}

random_ipsum <- function(nrow, ncol) {
  as.data.frame(
    do.call(
      cbind,
      lapply(
        1:ncol,
        function(x) vec_ipsum(nrow)
      )
    )
  )
}
