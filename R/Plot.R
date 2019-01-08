#' A Random ggplot
#'
#' This function returns a ggplot object, which can be passed to `renderPlot` and `plotOutput`
#'
#' @param type type of the geom. Can be any of "random", "point", "bar", "boxplot","col", "tile", "line", "bin2d", "contour", "density", "density_2d", "dotplot", "hex", "freqpoly", "histogram", "ribbon", "raster", "tile", "violin" and defines the geom of the ggplot. Default is "random", and chooses a random geom for you.
#'
#' @importFrom ggplot2 ggplot aes geom_point geom_bar scale_color_viridis_d theme_minimal geom_boxplot labs coord_flip geom_tile geom_line facet_grid geom_col scale_fill_viridis_c
#'
#' @return a ggplot
#'
#' @export

random_ggplot <- function(type = c("random", "point", "bar",
                                   "boxplot","col", "tile",
                                   "line", "bin2d", "contour",
                                   "density", "density_2d", "dotplot",
                                   "hex", "freqpoly", "histogram",
                                   "ribbon", "raster", "tile",
                                   "violin")) {
  type_matched <- match.arg(type)

  if (type_matched == "random") {
    type_matched <- sample(formals()$type, 1)
  }
  r <- switch(as.character(type_matched),
      "point" = sample(0:5, 1),
      "bar" = sample(10:11, 1),
      "boxplot" = sample(20:21, 1),
      "col" = sample(30:31, 1),
      "tile" = sample(40:41, 1),
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
      "tile" = sample(160:161, 1),
      "violin" = sample(170:171, 1)
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
        facet_grid(.  ~ Species) +
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
    "4" = list(
      ggplot(airquality) +
        aes(Solar.R, Wind, color = as.factor(Month)) +
        geom_point() +
        theme_minimal()
    ),
    "5" = list(
      ggplot(airquality) +
        aes(Wind, Temp, color = as.factor(Month)) +
        geom_point() +
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
      as.data.frame(table(ggplot2::diamonds$cut)) %>%
        ggplot() +
        aes(Var1, Freq) +
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
    ),
    "60" = list(
      ggplot(ggplot2::diamonds) +
        aes(x, y) +
        xlim(4, 10) +
        ylim(4, 10) +
        geom_bin2d() +
        theme_minimal()
    ),
    "61" = list(
      ggplot(mtcars) +
        aes(mpg, disp) +
        geom_bin2d() +
        theme_minimal()
    ),
    "70" = list(
      ggplot(faithfuld, aes(waiting, eruptions, z = density)) +
        geom_contour() +
        theme_minimal()
    ),
    "71" = list(
      ggplot(faithfuld, aes(waiting, eruptions, z = density)) +
        geom_contour(binwidth = 0.001) +
        theme_minimal()
    ),
    "80" = list(
      ggplot(iris, aes(Sepal.Length)) +
        geom_density() +
        theme_minimal()
    ),
    "81" = list(
      ggplot(ggplot2::diamonds, aes(depth, fill = cut, colour = cut)) +
        geom_density(alpha = 0.1) +
        xlim(55, 70) +
        theme_minimal()
    ),
    "82" = list(
      ggplot(ggplot2::diamonds, aes(carat, fill = cut)) +
        geom_density(position = "stack") +
        theme_minimal()
    ),
    "90" = list(
      ggplot(faithful, aes(x = eruptions, y = waiting)) +
        geom_point() +
        xlim(0.5, 6) +
        ylim(40, 110) +
        geom_density_2d()  +
        theme_minimal()
    ),
    "91" = list(
      ggplot(ggplot2::diamonds[sample(nrow(ggplot2::diamonds), 1000), ],
             aes(x, y)) +
        geom_density_2d(aes(colour = cut)) +
        theme_minimal()
    ),
    "100" = list(
      ggplot(airquality, aes(x = Temp)) +
        geom_dotplot() +
        theme_minimal()
    ),
    "101" = list(
      ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
        geom_dotplot() +
        theme_minimal()
    ),
    "110" = list(
      ggplot(ggplot2::diamonds, aes(carat, price)) +
        geom_hex() +
        theme_minimal()
    ),
    "111" = list(
      ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
        geom_hex() +
        theme_minimal()
    ),
    "120" = list(
      ggplot(ggplot2::diamonds, aes(price, colour = cut)) +
        geom_freqpoly(binwidth = 500) +
        theme_minimal()
    ),
    "121" = list(
      ggplot(ggplot2::diamonds,
             aes(price, stat(density), colour = cut)) +
        geom_freqpoly(binwidth = 500) +
        theme_minimal()
    ),
    "130" = list(
      ggplot(iris, aes(Sepal.Length, fill = Species)) +
        geom_histogram(binwidth = 0.5)  +
        theme_minimal()
    ),
    "131" = list(
      ggplot(ggplot2::diamonds, aes(price, fill = color)) +
        geom_histogram()  +
        theme_minimal()
    ),
    "140" = list(
      ggplot(data.frame(year = 1875:1972,
                        level = as.vector(LakeHuron)), aes(year)) +
        geom_ribbon(aes(ymin=0, ymax=level))  +
        theme_minimal()
    ),
    "141" = list(
      ggplot(data.frame(year = 1875:1972,
                        level = as.vector(LakeHuron)), aes(year)) +
        geom_ribbon(aes(ymin = level - 1, ymax = level + 1), fill = "grey70")   +
        theme_minimal()
    ),
    "150" = list(
      ggplot(faithfuld, aes(waiting, eruptions)) +
        geom_raster(aes(fill = density))  +
        theme_minimal()
    ),
    "151" = list(
      ggplot(faithfuld, aes(waiting, eruptions)) +
        geom_raster(aes(fill = density), interpolate = TRUE)   +
        theme_minimal()
    ),
    "160" = list(
      ggplot(data.frame(
        x = rep(c(2, 5, 7, 9, 12), 2),
        y = rep(c(1, 2), each = 5),
        z = factor(rep(1:5, each = 2)),
        w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
      ), aes(x, y)) +
        geom_tile(aes(fill = z), colour = "grey50")  +
        theme_minimal()
    ),
    "161" = list(
      ggplot(data.frame(
        x = rep(c(2, 5, 7, 9, 12), 2),
        y = rep(c(1, 2), each = 5),
        z = factor(rep(1:5, each = 2)),
        w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
      ), aes(x, y, width = w)) +
        geom_tile(aes(fill = z), colour = "grey50")  +
        theme_minimal()
    ),
    "170" = list(
      ggplot(mtcars, aes(factor(cyl), mpg)) +
        geom_violin() +
        theme_minimal()
    ),
    "171" = list(
      ggplot(iris, aes(Species, Sepal.Length)) +
        geom_violin() +
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
#'
#' @return a ggplotly
#' @export
#'

random_ggplotly <- function(...){
  res <- random_ggplot(...)
  ggplotly(res)
}
