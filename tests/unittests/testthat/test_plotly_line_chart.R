# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_plotly_line_chart.R
# DESCRIPTION:    Test that plotly_line_chart() works.
#
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.1

# Define the unit test
# -------------------------------------------------------------------------
library(testthat)
test_that("plotly_line_charts() works", {
  require(plotly)
  expected <- (plot_ly(mpg, x = "displ", y = "hwy", plot_title = "Miles per Gallon vs. Engine Displacement", x_lab = "Engine Displacement (L)", y_lab = "Miles per Gallon"))
  actual <- plotly_line_chart(mpg, x = "displ", y = "hwy", plot_title = "Miles per Gallon vs. Engine Displacement", x_lab = "Engine Displacement (L)", y_lab = "Miles per Gallon")
  expect_equal(class(expected), class(actual))
  #expect_equal(actual$x$title$text, "Engine Displacement (L)")
  #expect_equal(actual$y$title$text, "Miles per Gallon")
  #expect_equal(actual$title$text, "Miles per Gallon vs. Engine Displacement")
})
