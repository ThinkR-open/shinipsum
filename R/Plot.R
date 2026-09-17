#' Categorical labels for random_ggplot("bar", n_bars =)
#' @noRd
make_bar_labels <- function(n) {
  if (n <= 26L) LETTERS[seq_len(n)] else sprintf("Cat%02d", seq_len(n))
}

#' A Random ggplot
#'
#' This function returns a ggplot object, which can be passed to `renderPlot` and `plotOutput`
#'
#' @param type type of the geom. Can be any of "random", "point", "bar", "boxplot","col", "tile", "line", "bin2d", "contour", "density", "density_2d", "dotplot", "hex", "freqpoly", "histogram", "ribbon", "raster", "violin", "ts" (alias "timeseries") and defines the geom of the ggplot. Default is "random", and chooses a random geom for you. The "ts" type returns a time-series oriented plot, with a `Date` on the x axis.
#' @param n_bars number of bars to draw. Only valid together with
#'   `type = "bar"`, and errors otherwise. When `NULL` (default) one of the
#'   built-in datasets is used instead.
#'
#' @importFrom ggplot2 ggplot aes geom_point geom_bar scale_color_viridis_d theme_minimal geom_boxplot labs coord_flip geom_tile geom_line geom_area facet_grid geom_col scale_fill_viridis_c
#' @importFrom ggplot2 xlim ylim geom_bin2d geom_contour geom_density geom_density_2d geom_dotplot
#' @importFrom ggplot2 scale_fill_viridis_d theme
#' @importFrom ggplot2 .data after_stat
#' @importFrom attempt stop_if_not
#' @importFrom ggplot2 geom_hex geom_freqpoly stat geom_histogram geom_ribbon geom_raster geom_violin
#'
#' @return a ggplot
#'
#' @export

random_ggplot <- function(type = c("random", "point", "bar",
                                   "boxplot","col", "tile",
                                   "line", "bin2d", "contour",
                                   "density", "density_2d", "dotplot",
                                   "hex", "freqpoly", "histogram",
                                   "ribbon", "raster",
                                   "violin", "ts"),
                          n_bars = NULL) {
  if (length(type) == 1L && identical(type, "timeseries")) {
    type <- "ts"
  }
  type_matched <- match.arg(type)

  if (!is.null(n_bars)) {
    stop_if_not(
      type_matched,
      ~ identical(.x, "bar"),
      '`n_bars` only applies to type = "bar"'
    )
    stop_if_not(
      n_bars,
      ~ is.numeric(.x) && length(.x) == 1L && is.finite(.x) &&
        .x >= 1 && .x == round(.x),
      "`n_bars` must be a single positive integer"
    )
    labels <- make_bar_labels(as.integer(n_bars))
    return(
      ggplot(data.frame(
        category = factor(labels, levels = labels),
        value = sample.int(100L, length(labels), replace = TRUE)
      )) +
        aes(.data$category, .data$value, fill = .data$category) +
        geom_col() +
        scale_fill_viridis_d() +
        theme_minimal() +
        theme(legend.position = "none")
    )
  }

  if (type_matched == "random") {
    form <- eval(formals()$type)
    # Removed random from the formals match
    form <- form[ - which(form == "random") ]
    type_matched <- sample( form, 1 )
  }

  r <- switch(as.character(type_matched),
      "point" = sample(0:5, 1),
      "bar" = sample(10:11, 1),
      "boxplot" = sample(20:21, 1),
      "col" = sample(30:31, 1),
      "tile" = sample(c(40:41, 160:161), 1),
      "line" = sample(50:51, 1),
      "bin2d" = sample(60:61, 1),
      "contour" = sample(70:71, 1),
      "density" = sample(80:82, 1),
      "density_2d" = sample(90:91, 1),
      "dotplot" = sample(100:101, 1),
      "hex" = sample(110:111, 1),
      "freqpoly" = sample(120:121, 1),
      "histogram" = sample(130:131, 1),
      "ribbon" = sample(140:141, 1),
      "raster" = sample(150:151, 1),
      "violin" = sample(170:171, 1),
      "ts" = sample(180:182, 1)
    )

  res <- switch(as.character(r),
    "0" = list(
      ggplot(datasets::iris) +
        aes(.data$Sepal.Length, .data$Sepal.Width, color = .data$Species) +
        geom_point() +
        scale_color_viridis_d() +
        theme_minimal()
    ),
    "1" = list(
      ggplot(datasets::iris) +
        aes(.data$Sepal.Length, .data$Petal.Width, color = .data$Species) +
        geom_point() +
        scale_color_viridis_d() +
        facet_grid(.  ~ Species) +
        theme_minimal()
    ),
    "2" = list(
      ggplot(datasets::mtcars) +
        aes(.data$mpg, .data$disp, color = .data$vs) +
        geom_point() +
        theme_minimal()
    ),
    "3" = list(
      ggplot(datasets::mtcars) +
        aes(.data$wt, .data$qsec, color = as.factor(.data$cyl)) +
        geom_point() +
        scale_color_viridis_d() +
        theme_minimal()
    ),
    "4" = list(
      ggplot(datasets::airquality) +
        aes(.data$Solar.R, .data$Wind, color = as.factor(.data$Month)) +
        geom_point() +
        theme_minimal()
    ),
    "5" = list(
      ggplot(datasets::airquality) +
        aes(.data$Wind, .data$Temp, color = as.factor(.data$Month)) +
        geom_point() +
        theme_minimal()
    ),
    "10" = list(
      ggplot(datasets::airquality) +
        aes(.data$Temp) +
        geom_bar() +
        scale_color_viridis_d() +
        labs(color = "Month") +
        theme_minimal()
    ),
    "11" = list(
      ggplot(datasets::mtcars) +
        aes(.data$cyl) +
        geom_bar(fill = "#440154FF") +
        theme_minimal()
    ),
    "20" = list(
      ggplot(datasets::airquality) +
        aes(.data$Month, .data$Ozone, group = .data$Month) +
        geom_boxplot() +
        theme_minimal()
    ),
    "21" = list(
      ggplot(datasets::iris) +
        aes(.data$Species, .data$Sepal.Length, group = .data$Species) +
        geom_boxplot() +
        coord_flip() +
        theme_minimal()
    ),
    "30" = list(
      as.data.frame(table(ggplot2::diamonds$cut)) %>%
        ggplot() +
        aes(.data$Var1, .data$Freq) +
        geom_col()
    ),
    "31" = list(
      ggplot2::economics %>%
        ggplot() +
        aes(.data$date, .data$unemploy) +
        geom_col()
    ),
    "40" = list(
      ggplot(ggplot2::faithfuld) +
        aes(.data$waiting, .data$eruptions, fill = .data$density) +
        geom_tile() +
        scale_fill_viridis_c()
    ),
    "41" = list(
      ggplot(ggplot2::txhousing) +
        aes(.data$year, .data$month, fill = .data$median) +
        geom_tile() +
        scale_fill_viridis_c()
    ),
    "50" = list(
      ggplot(datasets::women) +
        aes(.data$height, .data$weight) +
        (if (utils::packageVersion("ggplot2") >= "3.4.0") {
          geom_line(linewidth = 2)
        } else {
          geom_line(size = 2)
        }) +
        theme_minimal()
    ),
    "51" = list(
      ggplot(datasets::cars) +
        aes(.data$speed, .data$dist) +
        geom_line() +
        theme_minimal()
    ),
    "60" = list(
      ggplot(ggplot2::diamonds) +
        aes(.data$x, .data$y) +
        xlim(4, 10) +
        ylim(4, 10) +
        geom_bin2d() +
        theme_minimal()
    ),
    "61" = list(
      ggplot(datasets::mtcars) +
        aes(.data$mpg, .data$disp) +
        geom_bin2d() +
        theme_minimal()
    ),
    "70" = list(
      ggplot(ggplot2::faithfuld, aes(.data$waiting, .data$eruptions, z = .data$density)) +
        geom_contour() +
        theme_minimal()
    ),
    "71" = list(
      ggplot(ggplot2::faithfuld, aes(.data$waiting, .data$eruptions, z = .data$density)) +
        geom_contour(binwidth = 0.001) +
        theme_minimal()
    ),
    "80" = list(
      ggplot(datasets::iris, aes(.data$Sepal.Length)) +
        geom_density() +
        theme_minimal()
    ),
    "81" = list(
      ggplot(ggplot2::diamonds, aes(.data$depth, fill = .data$cut, colour = .data$cut)) +
        geom_density(alpha = 0.1) +
        xlim(55, 70) +
        theme_minimal()
    ),
    "82" = list(
      ggplot(ggplot2::diamonds, aes(.data$carat, fill = .data$cut)) +
        geom_density(position = "stack") +
        theme_minimal()
    ),
    "90" = list(
      ggplot(datasets::faithful, aes(x = .data$eruptions, y = .data$waiting)) +
        geom_point() +
        xlim(0.5, 6) +
        ylim(40, 110) +
        geom_density_2d()  +
        theme_minimal()
    ),
    "91" = list(
      ggplot(ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ],
             aes(.data$x, .data$y)) +
        geom_density_2d(aes(colour = .data$cut)) +
        theme_minimal()
    ),
    "100" = list(
      ggplot(datasets::airquality, aes(x = .data$Temp)) +
        geom_dotplot() +
        theme_minimal()
    ),
    "101" = list(
      ggplot(datasets::iris, aes(x = .data$Sepal.Length, fill = .data$Species)) +
        geom_dotplot() +
        theme_minimal()
    ),
    "110" = list(
      ggplot(ggplot2::diamonds, aes(.data$carat, .data$price)) +
        geom_hex() +
        theme_minimal()
    ),
    "111" = list(
      ggplot(datasets::iris, aes(.data$Sepal.Length, .data$Sepal.Width)) +
        geom_hex() +
        theme_minimal()
    ),
    "120" = list(
      ggplot(ggplot2::diamonds, aes(.data$price, colour = .data$cut)) +
        geom_freqpoly(binwidth = 500) +
        theme_minimal()
    ),
    "121" = list(
      ggplot(ggplot2::diamonds,
             aes(.data$price, after_stat(.data$density), colour = .data$cut)) +
        geom_freqpoly(binwidth = 500) +
        theme_minimal()
    ),
    "130" = list(
      ggplot(datasets::iris, aes(.data$Sepal.Length, fill = .data$Species)) +
        geom_histogram(binwidth = 0.5)  +
        theme_minimal()
    ),
    "131" = list(
      ggplot(ggplot2::diamonds, aes(.data$price, fill = .data$color)) +
        geom_histogram()  +
        theme_minimal()
    ),
    "140" = list(
      ggplot(data.frame(year = 1875:1972,
                        level = as.vector(datasets::LakeHuron)), aes(.data$year)) +
        geom_ribbon(aes(ymin=0, ymax=.data$level))  +
        theme_minimal()
    ),
    "141" = list(
      ggplot(data.frame(year = 1875:1972,
                        level = as.vector(datasets::LakeHuron)), aes(.data$year)) +
        geom_ribbon(aes(ymin = .data$level - 1, ymax = .data$level + 1), fill = "grey70")   +
        theme_minimal()
    ),
    "150" = list(
      ggplot(ggplot2::faithfuld, aes(.data$waiting, .data$eruptions)) +
        geom_raster(aes(fill = .data$density))  +
        theme_minimal()
    ),
    "151" = list(
      ggplot(ggplot2::faithfuld, aes(.data$waiting, .data$eruptions)) +
        geom_raster(aes(fill = .data$density), interpolate = TRUE)   +
        theme_minimal()
    ),
    "160" = list(
      ggplot(data.frame(
        x = rep(c(2, 5, 7, 9, 12), 2),
        y = rep(c(1, 2), each = 5),
        z = factor(rep(1:5, each = 2)),
        w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
      ), aes(.data$x, .data$y)) +
        geom_tile(aes(fill = .data$z), colour = "grey50")  +
        theme_minimal()
    ),
    "161" = list(
      ggplot(data.frame(
        x = rep(c(2, 5, 7, 9, 12), 2),
        y = rep(c(1, 2), each = 5),
        z = factor(rep(1:5, each = 2)),
        w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
      ), aes(.data$x, .data$y, width = .data$w)) +
        geom_tile(aes(fill = .data$z), colour = "grey50")  +
        theme_minimal()
    ),
    "170" = list(
      ggplot(datasets::mtcars, aes(factor(.data$cyl), .data$mpg)) +
        geom_violin() +
        theme_minimal()
    ),
    "171" = list(
      ggplot(datasets::iris, aes(.data$Species, .data$Sepal.Length)) +
        geom_violin() +
        theme_minimal()
    ),
    "180" = list(
      ggplot(ggplot2::economics) +
        aes(.data$date, .data$unemploy) +
        geom_line() +
        labs(x = "date", y = "unemployment") +
        theme_minimal()
    ),
    "181" = list(
      ggplot(
        data.frame(
          date = seq(
            as.Date("1949-01-01"),
            by = "month",
            length.out = length(datasets::AirPassengers)
          ),
          passengers = as.numeric(datasets::AirPassengers)
        )
      ) +
        aes(.data$date, .data$passengers) +
        geom_line() +
        geom_point(size = 0.8) +
        theme_minimal()
    ),
    "182" = list(
      ggplot(ggplot2::economics) +
        aes(.data$date, .data$psavert) +
        geom_area(fill = "#440154FF", alpha = 0.7) +
        labs(x = "date", y = "personal savings rate") +
        theme_minimal()
    )
  )
  res[[1]]
}



#' A Random ggplotly
#'
#' This function returns a ggplotly object, which can be passed to `renderPlotly` and `plotlyOutput`
#'
#' @param ... arg to pass to `random_ggplot`.
#' @importFrom plotly ggplotly
#'
#' @return a ggplotly
#' @export
#'

random_ggplotly <- function(...){
  res <- random_ggplot(...)
  ggplotly(res)
}
