# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           ae_attendance_raw.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.1

# Define {targets} function
# -------------------------------------------------------------------------
f_ae_attendance_raw <- function(dataset_name) {
  
  # Load packages and utilities
  source("utilities/get_nhsr_dataset.R")
  
  # Define input dataset(s)
  input_df <- get_nhsr_dataset(dataset_name=dataset_name)
  
  # Define Transform
  output_df <- input_df
  
  return(output_df)
}