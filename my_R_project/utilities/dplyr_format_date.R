# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           dplyr_format_date.R
# DESCRIPTION:    Function that takes a dataframe, a list of column names,
#                 and a date format string as inputs and allows you to apply
#                 several date formatting options to the specified columns

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        19 Dec 2022
# VERSION:        0.0.1

# Define function
# -------------------------------------------------------------------------
dplyr_format_date <- function(data, cols, date_format) {
  require(dplyr)
  data %>%
    dplyr::mutate_at(dplyr::vars(cols), function(x) {
      as.character(format(as.Date(x), date_format))
    })
}