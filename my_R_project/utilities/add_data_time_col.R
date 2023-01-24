# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           add_date_time_col.R
# DESCRIPTION:    Function that takes a data frame and a column name as input
#                 and applies the mutate function to add a new date or time
#                 component column extracted from a date-time column.

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        08 Jan 2023
# VERSION:        0.0.1

# Define function
# -------------------------------------------------------------------------
add_date_time_col <- function(data,
                              date_time_col,
                              year = FALSE,
                              month = FALSE,
                              mday = FALSE,
                              hour = FALSE,
                              minute = FALSE,
                              second = FALSE) {
  require(dplyr)
  require(lubridate)
  if (year) {
    data <- data %>%
      mutate(year = lubridate::year({{ date_time_col }}))
  }
  if (month) {
    data <- data %>%
      mutate(month = lubridate::month({{ date_time_col }}))
  }
  if (mday) {
    data <- data %>%
      mutate(mday = lubridate::mday({{ date_time_col }}))
  }
  if (hour) {
    data <- data %>%
      mutate(hour = lubridate::hour({{ date_time_col }}))
  }
  if (minute) {
    data <- data %>%
      mutate(minute = lubridate::minute({{ date_time_col }}))
  }
  if (second) {
    data <- data %>%
      mutate(second = lubridate::second({{ date_time_col }}))
  }
  return(data)
}