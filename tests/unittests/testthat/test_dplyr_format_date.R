
# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_dplyr_format_date.R
# DESCRIPTION:    ...

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.2

# Define the unit test
# -------------------------------------------------------------------------
test_that("format_columns formats columns correctly", {
  data <- data.frame(decimal = c(0.5, 0.6, 0.7),
                     number = c(10000, 20000, 30000),
                     date = c("2022-01-01", "2022-02-01", "2022-03-01"))

  # Test formatting as dates
  expected_output <- data.frame(decimal = c(0.5, 0.6, 0.7),
                                number = c(10000, 20000, 30000),
                                date = c("Jan-22", "Feb-22", "Mar-22"))
  actual_output <- dplyr_format_date(data, "date", "%b-%y")
  expect_equal(actual_output, expected_output)
})