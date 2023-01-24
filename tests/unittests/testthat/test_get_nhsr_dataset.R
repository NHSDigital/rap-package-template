# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           test_get_nhsr_dataset.R
# DESCRIPTION:    This test case tests two things:
#                 1) When a valid dataset name is provided, the
#                    get_nhsr_datasets function should return a
#                    'data.frame' type object.
#                 2) When an invalid dataset name is provided, the
#                    get_nhsr_datasets function should return null.
#
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        15 Dec 2022
# VERSION:        0.0.1


# Define the unit test
# -------------------------------------------------------------------------
test_that("get_nhsr_datasets returns a dataframe.", {
  # Test that the function returns non-null dataset when a valid dataset
  # name is provided
  expect_s3_class(get_nhsr_dataset("ae_attendances"), "data.frame")

  # Test that the function returns an error when an invalid dataset name
  # is provided
  expect_null(get_nhsr_dataset("invalid_dataset_name"))
})
