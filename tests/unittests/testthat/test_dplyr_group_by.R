# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_create_directory.R
# DESCRIPTION:    The test creates a temporary directory, defines the path to
#                 a test directory, and then ensures that the test directory
#                 does not exist. It then calls the `create_directory()`
#                 function to create the test directory, and finally usesthe
#                 `expect_true()` function to verify that the directory was
#                 successfully created.
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        15 Dec 2022
# VERSION:        0.0.1

# Define the unit test
# -------------------------------------------------------------------------
test_that("dplyr_group_by() works correctly", {
  expect_equal(dplyr_group_by(mpg, c("manufacturer", "model")),
               mpg %>% group_by(manufacturer, model))
})