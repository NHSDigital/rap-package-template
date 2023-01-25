# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           ae_attendance_type1.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        25 Jan 2022
# VERSION:        0.0.1

# Define {targets} function
# -------------------------------------------------------------------------
f_ae_attendance_type1 <- function(ae_attendances_df, ods_codes_df) {
  require("dplyr")
  require("lubridate")
  
  # filter to type1, calculate performance, add month col
  type1_df <- ae_attendances_df %>%
    filter(type == 1) %>%
    mutate(performance = 1 - breaches/attendances) %>%
    mutate(month = lubridate::month(period))
  
  # calculate mean, min, max
  min_max <- type1_df %>%
     group_by(month) %>%
     summarise(across(performance, list(min=min,
                                        max=max,
                                        average=mean)))

  # join mean, min, max
  type1_df <- left_join(type1_df, min_max, by = "month")
  
  # join on ods codes for Trust names
  type1_df <- left_join(type1_df, ods_codes_df, by = "org_code") %>%
    arrange(period)
  
  output_df <- type1_df
  
  return(output_df)
}