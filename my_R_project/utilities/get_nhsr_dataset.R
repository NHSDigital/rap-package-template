# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           get_nhsr_dataset.R
# DESCRIPTION:    Load a dataset from the open data {NHSRdatasets} package.
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        16 Dec 2022
# VERSION:        0.0.1


# Define function
# -------------------------------------------------------------------------
# https://nhs-r-community.github.io/NHSRdatasets/index.html

get_nhsr_dataset <- function(dataset_name = "ae_attendances") {
  require(NHSRdatasets)
  # Use tryCatch to handle any errors that may occur
  tryCatch({
    # Try to get the dataset
    df <- eval(parse(text = dataset_name))

    # Return the dataset if it exists
    return(df)
  }, error = function(e) {
    # If an error occurs, print an error message and return NULL
    print(paste0(
        "Error: dataset not found in {NHSRdatasets} package",
        "check you have the correct `dataset_name` at: ",
        "https://nhs-r-community.github.io/NHSRdatasets/reference/index.html."))
    return(NULL)
  })
}