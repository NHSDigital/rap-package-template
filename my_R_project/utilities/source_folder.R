# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           source_folder.R
# DESCRIPTION:    Finds all .R and .r files within a folder and loads them.
#                 Returns the number of loaded .R scripts
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        20 Dec 2022
# VERSION:        0.0.1


# function
# -------------------------------------------------------------------------
source_folder <- function(folder, recursive = FALSE, ...) {
    files <- list.files(folder, pattern = "[.][rR]$",
                        full.names = TRUE, recursive = recursive)
    if (!length(files))
        stop(simpleError(sprintf('No R files in folder "%s"', folder)))
    src <- invisible(lapply(files, source, ...))
    message(sprintf('%s files sourced from folder "%s"', length(src), folder))
    return()
}