# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           _targets.R
# DESCRIPTION:    Define target functions
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        17 Dec 2022
# VERSION:        0.0.2

# Load libraries and global vars
# -------------------------------------------------------------------------
library(targets)
library(tarchetypes)
library(here)
tar_option_set(packages = c("readr",
                            "here",
                            "NHSRdatasets",
                            "dplyr",
                            "knitr",
                            "plotly"))

# Load all functions in the utilities folder
# -------------------------------------------------------------------------
source("pkg/R/source_folder.R")
source_folder("pkg/R", recursive = TRUE)

# Start target list
# -------------------------------------------------------------------------
list(

# Ingest ae_attendance data from {NHSRdatasets} package
# -------------------------------------------------------------------------
nhsr_dataset_name <- "ae_attendances",

targets::tar_target(
  name = ae_attendance_raw,
  command = get_nhsr_dataset(nhsr_dataset_name)
),

# Sink ae_attendance data to raw
# -------------------------------------------------------------------------
targets::tar_target(
  name = ae_attendance_raw_sink,
  command = write_to_csv(data = ae_attendance_raw,
                     "data/raw/NHSRdatasets",
                     "ae_attendances.csv"),
  format = "file"
),

# filter on attendances
# -------------------------------------------------------------------------
targets::tar_target(
  name = ae_attendance_type1,
  command = dplyr_filter_cols(data = ae_attendance_raw,
                              type == 1)
),

# filter on attendances
# -------------------------------------------------------------------------
targets::tar_target(
  name = ae_attendance_type2,
  command = dplyr_filter_cols(data = ae_attendance_raw,
                              type != 1)
),

# Group data by date (i.e., period)
# -------------------------------------------------------------------------
targets::tar_target(
  name = england_performance_raw,
  command = add_metric_col_percent(data = ae_attendance_type1,
                                   "period",
                                   "breaches",
                                   "attendances",
                                   "performance")
),

# add_date_time_col
# -------------------------------------------------------------------------
targets::tar_target(
  name = england_performance_date,
  command = add_date_time_col(data = england_performance_raw, period,
                                                              month = TRUE)
),


# make ploty line chart
# -------------------------------------------------------------------------
targets::tar_target(
  name = england_performance_linechart,
  command = plotly_line_chart(data = england_performance_raw,
    "period",
    "performance",
    "NHS England A&E 4 Hour Performance",
    "Month of attendance",
    "% of attendances that met the 4 hour standard")
),

# set the [period] column to show in Month-Year ("%b-%y") format
# -------------------------------------------------------------------------
targets::tar_target(
  name = england_performance_format_date,
  command = dplyr_format_date(data = england_performance_raw, "period", "%b-%y")
),

# set the [attendances, breaches] column to 1000s (comma) format
# -------------------------------------------------------------------------
targets::tar_target(
  name = england_performance_format_comma,
  command = dplyr_format_num(data = england_performance_format_date,
                             c("attendances", "breaches"), "comma", digits = 1)
),

# set the [performance] column to % (percent) format
# -------------------------------------------------------------------------
targets::tar_target(
  name = england_performance_format_percent,
  command = dplyr_format_num(data = england_performance_format_comma,
                             c("performance"), "percent", digits = 1)
),

# write to markdown table
# -------------------------------------------------------------------------
targets::tar_target(
  name = england_performance_to_markdown_table,
  command = knitr_markdown_table(data = england_performance_format_percent, 10)
),

# Render Quarto template
# -------------------------------------------------------------------------
tarchetypes::tar_quarto(report, here("templates/ae_attendance_mvp.qmd"),
                        execute_params = list(test = "test"))

# End target list
# -------------------------------------------------------------------------
)
