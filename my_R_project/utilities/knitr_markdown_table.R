# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           knitr_markdown_table.R
# DESCRIPTION:    Return a markdown table from a dataframe
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        20 Dec 2022
# VERSION:        0.0.1


# function
# -------------------------------------------------------------------------
knitr_markdown_table <- function(data, num_rows) {
  require(knitr)
  require(dplyr)
  data <- data %>%
    head(num_rows)
  knitr::kable(data, format = "markdown")
}

data <- mtcars
knitr_markdown_table(data, num_rows = 10)
