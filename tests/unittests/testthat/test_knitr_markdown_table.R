# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_knitr_markdown_table.R
# DESCRIPTION:    The test ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        20 Dec 2022
# VERSION:        0.0.1

# Define the unit test
# -------------------------------------------------------------------------
test_that("knitr_markdown_table() works", {
  data <- mtcars
  expected_output_class <- "knitr_kable"
  actual_output <- knitr_markdown_table(data, num_rows = 10)
  expect_equal(class(actual_output), expected_output_class)
})
