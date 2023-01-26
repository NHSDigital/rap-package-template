# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_ggplot_line_chart.R
# DESCRIPTION:    Test that ggplot_line_chart() works.
#
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.1

library(testthat)
test_that("plotly_count_linechart_target works", {
  expect_equal(class(plotly_count_linechart_target(mpg, "class", "cty", "Class", "City Miles per Gallon")), c("gg", "ggplot"))
})