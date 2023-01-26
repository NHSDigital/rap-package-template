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

hline <- function(y = 0, color = "#333333", width = 0.5) {
  list(
    type = "line",
    x0 = 0,
    x1 = 1,
    xref = "paper",
    y0 = y,
    y1 = y,
    line = list(color = color, opacity = 0.5, width = width,  dash = "dash")
  )
}

text_annotate <- function(x = "2019-08-01",
                          y = 0,
                          color = "#1AA3C6",
                          text = "text") {
  list(
    x = x,
    y = y,
    text = text,
    xref = "x",
    yref = "y",
    font = list(color = color,
                size = 12),
    showarrow = FALSE)
}

recap_option <- function(data, dropdown_col) {
  names <- unique(data[dropdown_col][[1]])
  recap_option <- list()
  for (i in 1:length(names)) {
    recap_option[[i]] <- list(method = "restyle",
                 args = list("transforms[0].value", names[[i]]),
                 label = names[i])
  }
  return(recap_option)
}

plotly_line_chart_minmax_dropdown <- function(data, x, y, min, max, mean,
                              target,
                              dropdown,
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
              line = list(color = 'rgba(174, 37, 115, 0.5)',
                          width = 2,
                          dash = 'dash'),
              name = "(Benchmark)",
              hovertemplate = paste('%{y:.1%}')) %>%
    add_trace(x = data[x][[1]],
              y = target,
              line = list(color='#30BCAD',
                          width = 2,
                          dash = 'dash'),
              name = "(Target)",
              hovertemplate = paste('%{y:.1%}')) %>%
    add_trace(type = "scatter",
              mode = "lines",
              x = data[x][[1]],
              y = data[y][[1]],
              name = "Performance",
              line = list(color = 'rgb(22, 96, 167)',
                          width = 3, dash = 'solid'),
              transforms = list(list(type = "filter",
                              target = data[dropdown][[1]],
                              operation = 'in',
                              value = unique(data[dropdown][[1]]))),
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
           updatemenus = list(list(
                xanchor = "left",
                yanchor = "top",
                x = 0,
                y = 1.2,
                type = "dropdown",
                active = 0,
                buttons = recap_option(data = data,
                                       dropdown_col = dropdown)
           )),
           margin = list(l = 20, r = 20, b = 70, t = 50, pad = 4))
  if (percent) {
    fig <- fig %>%
        layout(yaxis = list(tickformat = "0%"))
  }
  return(fig)
}
