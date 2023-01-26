# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           plotly_line_chart.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.1


# Define function
# -------------------------------------------------------------------------
plotly_line_chart <- function(data, x, y,
                              plot_title, x_lab, y_lab) {
  require(dplyr)
  require(plotly)
  fig <- plot_ly(data, x = data[x][[1]], y = data[y][[1]],
                 type = "scatter", mode = "lines")
  fig <- fig %>%
    layout(title = plot_title,
           xaxis = list(title = x_lab),
           yaxis = list(title = y_lab))
  return(fig)
}
