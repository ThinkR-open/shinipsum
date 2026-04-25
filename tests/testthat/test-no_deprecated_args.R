test_that("random_ggplot('line') does not emit ggplot2 'size' deprecation (#13)", {
  # ggplot2 >= 3.4 deprecated size= for line geoms in favour of linewidth=.
  # Force the line geom by passing type = 'line'; either of the two line
  # variants must be deprecation-clean.
  withr::with_seed(42, {
    p <- random_ggplot("line")
  })
  # Building the plot is what triggers the lifecycle warning, not the
  # construction. expect_no_warning() requires testthat 3.1.5+.
  if (utils::packageVersion("testthat") >= "3.1.5") {
    expect_no_warning(invisible(ggplot2::ggplot_build(p)))
  } else {
    msgs <- capture_warnings(invisible(ggplot2::ggplot_build(p)))
    expect_false(any(grepl("size.*deprecated", msgs)))
  }
})

test_that("Plot.R does not reference geom_line(size = ...) (#13)", {
  # Static sweep: ggplot2 deprecated size= on every line geom in 3.4.
  src <- readLines(system.file("R", "Plot.R", package = "shinipsum"))
  if (length(src) == 0) {
    src <- readLines(file.path(testthat::test_path(), "..", "..", "R", "Plot.R"))
  }
  expect_false(any(grepl("geom_line\\([^)]*size\\s*=", src)),
    info = "geom_line() should use linewidth = ... instead of size = ...")
})
