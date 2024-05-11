get_matrix_easystats_rev_deps <- function(package) {
  deps_explain <- pak::pkg_deps_explain(package, "Matrix", dependencies = TRUE)
  purrr::flatten_chr(deps_explain$paths$Matrix)
}

deps <-
  purrr::map(
  setdiff(easystats:::.packages_on_cran(), c("insight", "parameters")),
  get_matrix_easystats_rev_deps
) |>
  purrr::flatten_chr() |>
  unique()

cat(paste0(deps, collapse = "?ignore-before-r=4.4.0\n"))
