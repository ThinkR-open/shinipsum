lorem <- readLines("data-raw/lorem")  %>%
  paste(collapse = " ")
usethis::use_data(lorem, overwrite = TRUE)

library(tokenizers)

lorem_words <- lorem %>%
  tokenize_words(lowercase = FALSE) %>%
  c(recursive = TRUE)
usethis::use_data(lorem_words, overwrite = TRUE)
