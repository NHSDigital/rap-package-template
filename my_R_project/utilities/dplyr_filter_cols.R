# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           dplyr_filter_cols.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        20 Dec 2022
# VERSION:        0.0.1


# Define function
# -------------------------------------------------------------------------
dplyr_filter_cols <- function(data, logic) {
    if (!require(dplyr)) {
    stop("{dplyr} package is not installed")
  }
  if (!is.data.frame(data)) {
    stop("data must be a dataframe")
  }
  df <- dplyr::filter(data, {{ logic }})
  return(df)
}

# Note that in recent versions of dplyr the standard evaluation versions of the dplyr functions have been "soft deprecated" in favor of non-standard evaluation.

# see https://dplyr.tidyverse.org/articles/compatibility.html#deprecation-of-underscored-verbs_


#Useful filter functions

#There are many functions and operators that are useful when constructing the expressions used to filter the data:

#    ==, >, >= etc

#    &, |, !, xor()

 #   is.na()

#    between(), near()
