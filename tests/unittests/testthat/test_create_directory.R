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
test_that("create_directory() creates a directory", {
  # Create a temporary directory to store test files
  tmp_dir <- tempdir()

  # Define the path to a test directory
  test_dir <- file.path(tmp_dir, "test_dir")

  # Ensure that the test directory does not exist
  if (file.exists(test_dir)) file.remove(test_dir)

  # Call the create_directory() function to create the test directory
  create_directory(test_dir)

  # Test that the directory was created successfully
  expect_true(file.exists(test_dir))
})
