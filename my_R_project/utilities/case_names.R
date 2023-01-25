# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           case_names.R
# DESCRIPTION:    Function that takes a col of CAPITAL case organisation
#                 names and returns Title case names with NHS specific
#                 exceptions (NHS, NFT, etc..)

# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        08 Jan 2023
# VERSION:        0.0.1

# Define function
# -------------------------------------------------------------------------
case_names <- function(data, org_name) {
  require(purrr)  # for map2
  require(dplyr)
  require(stringi)
  require(stringr)

  patterns <- c("And", "In", "On", "With", "Nhs", "Sicbl", "Nft", "Pt", "Nt")
  replacements <- c("and", "in", "on", "with", "NHS", "SICBL", "NFT", "PT", "NT")

  data <- data %>%
    # org names
    mutate(org_name = stringi::stri_trans_totitle(org_name)) %>%
    mutate(org_name = str_replace(org_name, pattern = "And", replacement = "and")) %>%
    mutate(org_name = str_replace(org_name, pattern = "In", replacement = "in")) %>%
    mutate(org_name = str_replace(org_name, pattern = "On", replacement = "on")) %>%
    mutate(org_name = str_replace(org_name, pattern = "Of", replacement = "of")) %>%
    mutate(org_name = str_replace(org_name, pattern = "With", replacement = "with")) %>%
    mutate(org_name = str_replace(org_name, pattern = "Nhs", replacement = "NHS")) %>%
    mutate(org_name = str_replace(org_name, pattern = "Sicbl", replacement = "SICBL")) %>%
    mutate(org_name = str_replace(org_name, pattern = "Nft", replacement = "NFT")) %>%
    mutate(org_name = str_replace(org_name, pattern = "Pt", replacement = "PT")) %>%
    mutate(org_name = str_replace(org_name, pattern = "Nt", replacement = "NT"))
  return(data)
}