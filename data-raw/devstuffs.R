colin::fill_desc(
  "shinipsum",
  "Lorem-Ipsum-like Helpers for fast Shiny prototyping",
  "Prototype your shiny apps quickly with these Lorem-Ipsum-like Helpers.",
  "shinipsum"
)
d <- desc::description$new()
d$set("URL", "https://github.com/Thinkr-open/shinipsum")
d$set("BugReports", "https://github.com/Thinkr-open/shinipsum/issues")
d$write()

colin::new_r_file("DataTable")
colin::new_r_file("Image")
colin::new_r_file("Plot")
colin::new_r_file("Image")
colin::new_r_file("Print")
colin::new_r_file("Table")
colin::new_r_file("Text")
colin::new_r_file("utils")

usethis::use_package("ggplot2")
usethis::use_package("DT")
usethis::use_tidy_versions()
usethis::use_roxygen_md()
usethis::use_pipe()

usethis::use_testthat()
usethis::use_test("ggplot")
usethis::use_test("text")
usethis::use_test("random")
usethis::use_test("DT")
usethis::use_test("print")

usethis::use_code_of_conduct()
