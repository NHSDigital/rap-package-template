library(testthat)
test_that("plotly_count_linechart_target works", {
  expect_equal(class(plotly_count_linechart_target(mpg, "class", "cty", "Class", "City Miles per Gallon")), c("gg", "ggplot"))
})