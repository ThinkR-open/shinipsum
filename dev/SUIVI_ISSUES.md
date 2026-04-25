# Suivi — passe `fix/multiple-issues`

| # | Type | Résumé | Fix | Test |
|---|---|---|---|---|
| #13 | bug | `random_ggplot("line")` triggered ggplot2's `size→linewidth` deprecation warning | `geom_line(size = 2)` -> `geom_line(linewidth = 2)` | `tests/testthat/test-no_deprecated_args.R` (build no warning + static sweep) |
| #9 | feat | `random_image()` couldn't propagate `width` / `height` / `alt` | new params `width = NULL, height = NULL, alt = NULL` (kept default `list(src = ...)` shape) | `tests/testthat/test-image_args.R` |
| #5 | feat | no way to control the number of bars in `random_ggplot("bar")` | new `n_bars = NULL` parameter — when set, generates a synthetic categorical data frame so the rendered plot has *exactly* that many bars | `tests/testthat/test-bar_n.R` (1 / 3 / 7 / 27 bars + invalid input) |

## Issues envisagées mais non traitées

| # | Pourquoi pas |
|---|---|
| #4 | "time series option" — design choice (date axis, density, faceting) à arbitrer avec mainteneur. |
| #3 | "other lorem ipsum options" — choix de corpora alternatifs (cat ipsum, hipster ipsum…), demande d'inclure de nouveaux assets. |
| #2 | "Release 0.1.0" — meta. |
| #1 | `mock_frame()` — feature, demande design. |
| #10 | `_R_CHECK_USE_CODETOOLS_=false` — dépend du contexte de test downstream. |
