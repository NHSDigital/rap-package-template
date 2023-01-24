# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_add_metric_col_percent.R
# DESCRIPTION:    The test..
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        22 Dec 2022
# VERSION:        0.0.1

# Define the unit test
# -------------------------------------------------------------------------
test_that("add_metric_col_percent() works correctly", {
# Create a test data frame
    expected_output <- mpg %>%
        dplyr::group_by(manufacturer) %>%
        dplyr::summarise_at(vars(displ, cty), sum) %>%
        mutate(performance = 1 - displ / cty)


    # Run the function
    actual_output <- add_metric_col_percent(mpg,
                                         "manufacturer",
                                         "displ",
                                         "cty",
                                         "performance")
    expect_equal(expected_output, actual_output)
})

test_that("add_metric_col_percent() basic test with valid input", {
  data <- data.frame(grouping = c("A", "A", "B", "B"),
                     numerator = c(1, 2, 3, 4),
                     denominator = c(5, 6, 7, 8))
  expected_output <- data.frame(grouping = c("A", "B"),
                                numerator = c(3, 7),
                                denominator = c(11, 15),
                                new_col = c(0.72727273, 0.53333333))
  result <- add_metric_col_percent(data, "grouping", "numerator", "denominator", "new_col")
  expect_equal(result, expected_output)
})

test_that("add_metric_col_percent() test with empty data frame", {
  data <- data.frame()
  expected_output <- data.frame()
  result <- add_metric_col_percent(data, "grouping", "numerator", "denominator", "new_col")
  expect_equal(result, expected_output)
})

test_that("add_metric_col_percent() test with non-numeric columns", {
  data <- data.frame(grouping = c("A", "A", "B", "B"),
                     numerator = c("a", "b", "c", "d"),
                     denominator = c("e", "f", "g", "h"))
  result <- add_metric_col_percent(data, "grouping", "numerator", "denominator", "new_col")
  expect_error(result)
})

test_that("add_metric_col_percent() test with invalid column names", {
  data <- data.frame(grouping = c("A", "A", "B", "B"),
                     numerator = c(1, 2, 3, 4),
                     denominator = c(5, 6, 7, 8))
  result <- add_metric_col_percent(data, "invalid_col", "numerator", "denominator", "new_col")
  expect_error(result)
})

test_that("add_metric_col_percent() test with new_col already in data", {
  data <- data.frame(grouping = c("A", "A", "B", "B"),
                     numerator = c(1, 2, 3, 4),
                     denominator = c(5, 6, 7, 8),
                     new_col = c(0.2, 0.3, 0.4, 0.5))
  result <- add_metric_col_percent(data, "grouping", "numerator", "denominator", "new_col")
  expect_error(result)
})
