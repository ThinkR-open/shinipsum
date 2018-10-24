#' @importFrom ggplot2 ggplot aes geom_point geom_bar scale_color_viridis_d theme_minimal geom_boxplot labs coord_flip geom_tile geom_line facet_grid geom_col scale_fill_viridis_c
#' @importFrom dplyr case_when count vars
#' @export

random_ggplot <- function(type = NULL) {
  if (is.null(type)) {
    type <- sample(
      c("point", "bar", "boxplot","col", "tile","line"),
      1)
  }
  r <- switch(type,
      "point" = sample(0:3, 1),
      "bar" = sample(10:11, 1),
      "boxplot" = sample(20:21, 1),
      "col" = sample(30:31, 1),
      "tile" = sample(40:41, 1),
      "line" = sample(50:51, 1)
    )

  res <- switch(as.character(r),
    "0" = list(
      ggplot(iris) +
        aes(Sepal.Length, Sepal.Width, color = Species) +
        geom_point() +
        scale_color_viridis_d() +
        theme_minimal()
    ),
    "1" = list(
      ggplot(iris) +
        aes(Sepal.Length, Petal.Width, color = Species) +
        geom_point() +
        scale_color_viridis_d() +
        facet_grid(rows = vars(Species)) +
        theme_minimal()
    ),
    "2" = list(
      ggplot(mtcars) +
        aes(mpg, disp, color = vs) +
        geom_point() +
        theme_minimal()
    ),
    "3" = list(
      ggplot(mtcars) +
        aes(wt, qsec, color = as.factor(cyl)) +
        geom_point() +
        scale_color_viridis_d() +
        theme_minimal()
    ),
    "10" = list(
      ggplot(airquality) +
        aes(Temp) +
        geom_bar() +
        scale_color_viridis_d() +
        labs(color = "Month") +
        theme_minimal()
    ),
    "11" = list(
      ggplot(mtcars) +
        aes(cyl) +
        geom_bar(fill = "#440154FF") +
        theme_minimal()
    ),
    "20" = list(
      ggplot(airquality) +
        aes(Month, Ozone, group = Month) +
        geom_boxplot() +
        theme_minimal()
    ),
    "21" = list(
      ggplot(iris) +
        aes(Species, Sepal.Length, group = Species) +
        geom_boxplot() +
        coord_flip() +
        theme_minimal()
    ),
    "30" = list(
      ggplot2::diamonds %>%
        count(cut, color) %>%
        ggplot() +
        aes(cut, n, fill = color) +
        geom_col()
    ),
    "31" = list(
      ggplot2::economics %>%
        ggplot() +
        aes(date, unemploy) +
        geom_col()
    ),
    "40" = list(
      ggplot(ggplot2::faithfuld) +
        aes(waiting, eruptions, fill = density) +
        geom_tile() +
        scale_fill_viridis_c()
    ),
    "41" = list(
      ggplot(ggplot2::txhousing) +
        aes(year, month, fill = median) +
        geom_tile() +
        scale_fill_viridis_c()
    ),
    "50" = list(
      ggplot(women) +
        aes(height, weight) +
        geom_line(size = 2) +
        theme_minimal()
    ),
    "51" = list(
      ggplot(cars) +
        aes(speed, dist) +
        geom_line() +
        theme_minimal()
    )
  )
  res[[1]]
}
