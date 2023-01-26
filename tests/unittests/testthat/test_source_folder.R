# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_source_folder.R
# DESCRIPTION:    Test that `source_folder()` works with a valid folder,
#                 with recursive = TRUE, and throws an error on empty
#                 folder.

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        20 Dec 2022
# VERSION:        0.0.1

# Define the unit test
# -------------------------------------------------------------------------
test_that("source_folder() with a valid folder", {
  # Create a temp directory
  temp_dir <- tempdir()

  # Create 5 R scripts
  for (i in 1:5) {
    file.create(paste0(temp_dir,"/script", i, ".R"))
  }
  expected <- length(list.files(temp_dir,
                                pattern = "[.][rR]$",
                                full.names = TRUE))
  actual <- source_folder(temp_dir)
  expect_equal(expected, actual)
})

test_that("source_folder() with a valid folder  and recursive = TRUE", {
  # Create a temp directory
  temp_dir <- tempdir()

  # Create 5 R scripts
  for (i in 1:5) {
    file.create(paste0(temp_dir,"/script", i, ".R"))
  }
  expected <- length(list.files(temp_dir,
                                pattern = "[.][rR]$",
                                full.names = TRUE,
                                recursive = TRUE))
  actual <- source_folder(temp_dir, recursive = TRUE)
  expect_equal(expected, actual)
})

test_that("source_folder() throws an error with an invalid folder", {
  expect_error(source_folder(wrong_dir_name))
})
