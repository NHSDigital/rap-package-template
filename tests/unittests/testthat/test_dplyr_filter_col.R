# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_dplyr_filter_cols.R
# DESCRIPTION:    Test that the `dplyr_filter_cols()` function works with
#                 a dataset and filter logic (e.g., mpg > 30).
#
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.2

# Define the unit test
# -------------------------------------------------------------------------
test_that("dplyr_filter_cols works correctly", {
  df <- mtcars
  expected_output <- dplyr::filter(df, mpg > 30)
  actual_output <- dplyr_filter_cols(df, mpg > 30)
  expect_equal(expected_output, actual_output)
})

test_that("dplyr_filter_cols throws and error if not supplied a dataframe", {
  df <- "mtcars"
  expect_error(dplyr_filter_cols(df, mpg > 30))
})
