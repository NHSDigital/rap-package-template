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
remove <- c('zoom2d','pan2d', 'select2d', 'lasso2d', 'zoomIn2d',
            'zoomOut2d', 'autoScale2d', 'resetScale2d', 'zoom',
            'pan', 'select', 'zoomIn', 'zoomOut', 'autoScale',
            'resetScale', 'toggleSpikelines', 'hoverClosestCartesian',
            'hoverCompareCartesian', 'toImage')

plotly_line_chart_minmax <- function(data, x, y, min, max, mean,
                              plot_title,
                              x_lab, y_lab,
                              y_min, y_max,
                              percent = FALSE) {
  require(dplyr)
  require(plotly)
  fig <- plotly::plot_ly(data, type = "scatter", mode = "lines") %>%
    add_trace(x = data[x][[1]],
              y = data[min][[1]],
              type = 'scatter',
              mode = 'lines',
              line = list(color = 'transparent'),
              name = "(Min)",
              hovertemplate = paste('%{y:.1%}')) %>%
    add_trace(x = data[x][[1]],
              y = data[max][[1]],
              type = 'scatter',
              mode = 'lines',
              fill = 'tonexty',
              fillcolor='rgba(174, 37, 115, 0.1)',
              line = list(color = 'transparent'),
              name = "(Max)",
              hovertemplate = paste('%{y:.1%}')) %>%
    add_trace(x = data[x][[1]],
              y = data[mean][[1]],
              line = list(color='rgba(174, 37, 115, 0.5)',
                          width = 2,
                          dash = 'dash'),
              name = "(Benchmark)",
              hovertemplate = paste('%{y:.1%}')) %>%
    add_trace(type = "scatter",
              mode = "lines",
              x = data[x][[1]],
              y = data[y][[1]],
              name = "Performance",
              line = list(color = 'rgb(22, 96, 167)',
                          width = 3, dash = 'solid'),
              hovertemplate = paste('%{y:.1%}')) %>%
    config(modeBarButtonsToRemove = remove,
                 displaylogo = FALSE,
                 displayModeBar = TRUE) %>%
    layout(title = plot_title,
           font = list(size = 14),
           xaxis = list(title = x_lab),
           yaxis = list(title = y_lab,
                         range = c(y_min, y_max)),
           showlegend = FALSE,
           hovermode = "x unified",
           margin = list(l = 20, r = 20, b = 20, t = 40, pad = 0))
  if (percent) {
    fig <- fig %>%
        layout(yaxis = list (tickformat = "0%"))
  }
  return(fig)
}
