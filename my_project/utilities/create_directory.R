# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           create_directory.R
# DESCRIPTION:    Checks if the directory specified by `write_path` exists,
#                 and if not, creates it with the `dir.create()` function.
#                 The `recursive = TRUE` argument ensures that any missing
#                 parent directories are also created.
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        15 Dec 2022
# VERSION:        0.0.1


# Define function
# -------------------------------------------------------------------------
create_directory <- function(write_path) {
  if (!isTRUE(file.info(file.path(write_path))$isdir)) {
    dir.create(file.path(write_path), recursive = TRUE)
  }
}
