# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           dplyr_group_by.R
# DESCRIPTION:    Function that takes a dataframe, a list of column names,
#                 and converts it into a grouped dataframe where operations
#                 are performed "by group". dplyr_ungroup() removes grouping.

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:       19 Dec 2022
# VERSION:        0.0.1

# Define function
# -------------------------------------------------------------------------
dplyr_group_by <- function(data, col_list) {
  library(dplyr)
  df <- dplyr::group_by(data, .dots = col_list)
  return(df)
}