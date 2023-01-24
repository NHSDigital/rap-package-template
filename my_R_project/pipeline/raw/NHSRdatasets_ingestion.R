# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           NHSRdatasets_ingestion.R
# DESCRIPTION:    ...
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        21 Dec 2022
# VERSION:        0.0.1

# Load packages
# -------------------------------------------------------------------------
source("utilites/source_folder.R")
source_folder("utilites", recursive = TRUE)

# Define input dataset(s)
# -------------------------------------------------------------------------
nhsr_dataset_name <- "ae_attendances"
input_df <- get_nhsr_dataset(nhsr_dataset_name)

# Define transform
# -------------------------------------------------------------------------
csv_ingestion <- function(input_df) {
  output_df <- input_df
  
  return(output_df)
}

# Define output dataset
# -------------------------------------------------------------------------
path <- "data/raw/NHSRdatasets"
file <- "ae_attendances.csv"
write_to_csv(output_df, file_path, file_name)