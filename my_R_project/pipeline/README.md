# Medallion data architecture
Proposed "medallion architecture" processing steps [bronze, silver, gold] or [raw, interim, processed]

## Raw Datasets

This folder is for ingesting raw data from APIs, databases, local files and so on.

__No processing is done at this stage__ so that you can trace any issues back to the source even if the live dataset has changed since ingestion (also saved some time/effort by giving you access to raw without having to login, or download the data again).

## Interim Datasets

This folder is for data validation, transforming datasets to tidy/long format, and/or appending raw data if the data source is using an incremental data load (i.e., updating the dataset where only new or modified records are ingested to raw).

__No reference data/columns are added added at this stage unless absolutely necessary__ so that each dataset is kept to a minimum size. In complex data pipelines, interim dataset may be used in many different metrics &products. Each product may require different reference data/columns, so processing is kept to a minimum at this stage.

## Processed Datasets

This folder is for processed datasets into the final state, ready for use in modelling or analysis

__Here, reference data can be added and columns formatted__.