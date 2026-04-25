test_that("random_ggplot('line') does not emit ggplot2 'size' deprecation (#13)", {
  # ggplot2 >= 3.4 deprecated size= for line geoms in favour of linewidth=.
  # Force the line geom by passing type = 'line'; either of the two line
  # variants must be deprecation-clean.
  old_seed <- if (exists(".Random.seed", envir = .GlobalEnv, inherits = FALSE)) {
    get(".Random.seed", envir = .GlobalEnv)
  } else NULL
  on.exit(
    if (!is.null(old_seed)) assign(".Random.seed", old_seed, envir = .GlobalEnv)
    else if (exists(".Random.seed", envir = .GlobalEnv, inherits = FALSE)) {
      rm(list = ".Random.seed", envir = .GlobalEnv)
    },
    add = TRUE
  )
  set.seed(42)
  p <- random_ggplot("line")
  # Building the plot is what triggers the lifecycle warning, not the
  # construction. expect_no_warning() requires testthat 3.1.5+.
  if (utils::packageVersion("testthat") >= "3.1.5") {
    expect_no_warning(invisible(ggplot2::ggplot_build(p)))
  } else {
    msgs <- capture_warnings(invisible(ggplot2::ggplot_build(p)))
    expect_false(any(grepl("size.*deprecated", msgs)))
  }
})

