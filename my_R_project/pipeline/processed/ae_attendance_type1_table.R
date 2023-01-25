# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           ae_attendance_type1_table.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        25 Jan 2022
# VERSION:        0.0.1

# Define {targets} function
# -------------------------------------------------------------------------
f_ae_attendance_type1_table <- function(input_df) {
  require("dplyr")
  require("scales")
  
  type1_df_table <- input_df %>%
    mutate(breaches = format(round(breaches), nsmall = 0, big.mark=",")) %>%
    mutate(attendances = format(round(attendances), nsmall = 0, big.mark=",")) %>%
    mutate(admissions= format(round(admissions), nsmall = 0, big.mark=",")) %>%
    mutate(performance_min = scales::percent(performance, accuracy = 1)) %>%
    mutate(performance_max = scales::percent(performance, accuracy = 1)) %>%
    mutate(performance_average = scales::percent(performance, accuracy = 1)) %>%
    mutate(performance = scales::percent(performance, accuracy = 1)) %>%
    select(period, org_code, org_name, performance, attendances, breaches)
  
  output_df <- type1_df_table
  
  return(output_df)
}