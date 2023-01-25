# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           _targets.R
# DESCRIPTION:    Define targets pipeline
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        17 Dec 2022
# VERSION:        0.0.2

# Load Packages
# -------------------------------------------------------------------------
library(targets)
library(tarchetypes)
library(here)
library(quarto)
tar_option_set(packages = c("readr",
                            "here",
                            "NHSRdatasets",
                            "dplyr",
                            "quarto"))

# Load all functions in the utilities folder
# -------------------------------------------------------------------------
source("utilities/source_folder.R")
source_folder("pipeline", recursive = TRUE)

# Ingest ae_attendance data from {NHSRdatasets} package
# -------------------------------------------------------------------------
# define parameters
ae_attendance <- list()
nhsr_dataset_name <- "ae_attendances"

# define raw target
ae_attendance$raw <- targets::tar_target(
  name = ae_attendance_raw_data, # name of dataset
  command = f_ae_attendance_raw(nhsr_dataset_name) # pipeline function
  )

# define interim target
ae_attendance$interim <- targets::tar_target(
  name = ae_attendance_interim_data,
  command = f_ae_attendance_interim(ae_attendance_raw_data)
)

# define processed target
ae_attendance$processed <- targets::tar_target(
  name = ae_attendance_type1_data,
  command = f_ae_attendance_type1(ae_attendance_interim_data,
                                      trust_ods_codes_interim_data)
)

# Ingest Trust ODS codes from NHSE file store
# -------------------------------------------------------------------------
# define parameters
trust_ods_codes <- list()
file_url <- "https://nhsenglandfilestore.s3.amazonaws.com/ods/etrust.csv"

# define target
trust_ods_codes$raw <- targets::tar_target(
  name = trust_ods_codes_raw_data,
  command = f_trust_ods_codes_raw(file_url)
  )

# define interim target
trust_ods_codes$interim <- targets::tar_target(
  name = trust_ods_codes_interim_data,
  command = f_trust_ods_codes_interim(trust_ods_codes_raw_data)
)

# Render Quarto template
# -------------------------------------------------------------------------
# define target
render_ae_attendance_report <- tarchetypes::tar_quarto(report, "report_template.qmd", 
                                                       execute_params = list())

# Start target list
# -------------------------------------------------------------------------
list(ae_attendance$raw,
     ae_attendance$interim,
     trust_ods_codes$raw,
     trust_ods_codes$interim,
     ae_attendance$processed,
     render_ae_attendance_report)
