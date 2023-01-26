# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           trust_ods_codes_interim.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        25 Jan 2023
# VERSION:        0.0.1

# Define {targets} function
# -------------------------------------------------------------------------
f_trust_ods_codes_interim <- function(input_df) {

  # Load packages and utilities
  source("utilities/case_names.R")

  # Define Transform
  input_df <- input_df[, c(1, 2)] # select ods codes and trust names
  colnames(input_df) <- c("org_code", "org_name") # set col names
  output_df <- case_names(input_df, "org_code") # set Capital case

  return(output_df)
}