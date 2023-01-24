# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           add_metric_col_percent.R
# DESCRIPTION:    Function that takes a dataframe, a column to group by,
#                 and numerator and denominator column names.

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.1

# Define function
# -------------------------------------------------------------------------
add_metric_col_percent <- function(data,
                                   grouping,
                                   numerator,
                                   denominator,
                                   new_col) {
  # Validate input data
  if (!is.data.frame(data)) {
    stop("Error: 'data' must be a data frame")
  }
  if (!is.character(grouping) || !is.character(numerator) || !is.character(denominator) || !is.character(new_col)) {
    stop("Error: 'grouping', 'numerator', 'denominator', and 'new_col' must all be character strings")
  }
  if (!grouping %in% colnames(data)) {
    stop(paste("Error: '", grouping, "' is not a valid column name in 'data'"))
  }
  if (!numerator %in% colnames(data)) {
    stop(paste("Error: '", numerator, "' is not a valid column name in 'data'"))
  }
  if (!denominator %in% colnames(data)) {
    stop(paste("Error: '", denominator, "' is not a valid column name in 'data'"))
  }
  if (new_col %in% colnames(data)) {
    stop(paste("Error: '", new_col, "' already exists in 'data'"))
  }

  # Perform calculations and return result
  library(dplyr)
  df <- dplyr::group_by_(data, grouping) %>%
        dplyr::summarise_at(vars(numerator, denominator), sum)
  df[new_col] <- 1 - (df[numerator] / df[denominator])
  return(df)
}
