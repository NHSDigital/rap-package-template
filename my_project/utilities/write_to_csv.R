# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           write_to_csv.R
# DESCRIPTION:    Write a dataframe as a .csv file.
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        16 Dec 2022
# VERSION:        0.0.1


# Define function
# -------------------------------------------------------------------------
write_to_csv <- function(data, file_path, file_name) {
  require(here)
  require(rapdown)
  require(readr)

  # Construct the path for the output file
  write_path <- here::here(file_path)

  # Create the directory if it does not exist
  create_directory(write_path)

  # Write the data to the CSV file
  readr::write_csv(data, here::here(write_path, file_name), na = "NA")

  return(here(write_path, file_name))
}