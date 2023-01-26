# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           trust_ods_codes_raw.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        25 Jan 2023
# VERSION:        0.0.1

# Define {targets} function
# -------------------------------------------------------------------------
f_trust_ods_codes_raw <- function(file_url) {
  
  # Define input dataset(s)
  input_df <- read.csv(file_url)
  
  # Define Transform
  output_df <- input_df
  
  return(output_df)
}