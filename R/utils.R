vec_ipsum <- function(x){
  sample(lorem_words, x)
}

random_ipsum <- function(nrow, ncol){
  lapply(1:ncol, function(x) vec_ipsum(nrow)) %>%
    do.call(cbind, .) %>%
    as.data.frame()
}


