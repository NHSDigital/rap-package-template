# R notebook source
# -------------------------------------------------------------------------
# Copyright (c) 2022 Craig Robert Shenton. All rights reserved.
# Licensed under the MIT License. See license.txt in the project root for
# license information.
# -------------------------------------------------------------------------

# FILE:           create_report.R
# DESCRIPTION:    run target pipeline
# CONTRIBUTORS:   Craig R. Shenton
# CONTACT:        craig.shenton@nhs.net
# CREATED:        18 Dec 2022
# VERSION:        0.0.1

# Load libraries
# -------------------------------------------------------------------------
library(targets)
library(here)

# Run the targets pipleline
# -------------------------------------------------------------------------
# Run the pipeline you defined in the targets script file.
# default: _targets.R
source("_targets.R")
tar_make()

# Prune targets
# -------------------------------------------------------------------------
# Deletes the data and metadata of all the targets no longer present in
# your current target script file
# default: _targets.R
# tar_prune()
