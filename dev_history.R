usethis::use_build_ignore("dev_history.R")
usethis::use_build_ignore("img")
usethis::use_build_ignore("CODE_OF_CONDUCT.md")
usethis::use_build_ignore("LICENSE.md")
usethis::use_build_ignore("README.Rmd")
usethis::use_build_ignore("data-raw")

usethis::use_git_ignore("docs")

# doc
usethis::use_readme_rmd()
usethis::use_news_md()
usethis::use_package_doc()

# CI
use_testthat()
usethis::use_travis()
usethis::use_appveyor()
usethis::use_coverage()
usethis::use_pkgdown()


# dev
attachment::att_to_description(extra.suggests = c("pkgdown", "covr"))
devtools::check()
