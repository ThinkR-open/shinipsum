#' A Mock UI Layout
#'
#' Build a quick "zoning" of a Shiny UI: a row of bootstrap columns, each one
#' drawn as an empty bordered box with a centered label. Handy to sketch the
#' layout of an app before any real content exists.
#'
#' The returned object is a [htmltools::tagList()] (a self-contained CSS `<style>`
#' block plus the columns), so it can be dropped directly inside a
#' `shiny::fluidPage()` / `bslib::page_fluid()` and rendered as is.
#'
#' @param widths integer vector of bootstrap column widths (each between 1 and
#'   12). Its length defines the number of mock zones.
#' @param heights integer vector giving the visual height of each zone, expressed
#'   as a number of blank lines. Recycled to the length of `widths`. Default 3.
#' @param labels character vector of zone labels. Recycled to the length of
#'   `widths`. When `NULL` (default), short random lorem-ipsum labels are used.
#'
#' @importFrom htmltools tagList tags HTML
#' @importFrom attempt stop_if_not
#'
#' @return a [htmltools::tagList()]
#'
#' @export
#'
#' @examples
#' random_mock(c(4, 8))
#' random_mock(c(6, 6), labels = c("a plot here", "a table here"))
random_mock <- function(widths, heights = 3, labels = NULL) {
  stop_if_not(
    widths,
    ~ is.numeric(.x) && length(.x) >= 1L && all(!is.na(.x)) &&
      all(.x == as.integer(.x)) && all(.x >= 1L & .x <= 12L),
    "`widths` must be a non-empty vector of integers between 1 and 12"
  )

  n <- length(widths)
  heights <- rep_len(as.integer(heights), n)
  if (is.null(labels)) {
    labels <- vapply(
      seq_len(n),
      function(i) {
        trimws(random_text(nchars = 14, offset = (i - 1L) * 14L))
      },
      character(1)
    )
  }
  labels <- rep_len(as.character(labels), n)

  cols <- lapply(
    seq_len(n),
    function(i) {
      tags$div(
        class = paste0("col-sm-", widths[i], " shinipsum-mock"),
        lapply(
          seq_len(max(heights[i], 1L)),
          function(j) {
            tags$p(HTML("&nbsp;"))
          }
        ),
        tags$p(class = "shinipsum-mock-label", labels[i])
      )
    }
  )

  tagList(
    mock_css(),
    tags$div(class = "row", cols)
  )
}

#' @noRd
mock_css <- function() {
  tags$style(HTML("
    .shinipsum-mock {
      border: 2px solid #333;
      margin: 0.5em 0;
      padding: 0.5em;
      background: repeating-linear-gradient(
        45deg, #f6f6f6, #f6f6f6 10px, #efefef 10px, #efefef 20px
      );
    }
    .shinipsum-mock-label {
      text-align: center;
      font-weight: bold;
      margin: 0;
    }
  "))
}
