# Tidy

This folder is for data validation, transforming datasets to tidy/long format, and/or appending raw data if the data source is using an incremental data load (i.e., updating the dataset where only new or modified records are ingested to raw).

__No reference data/columns are added added at this stage unless absolutely necessary__ so that each dataset is kept to a minimum size. In complex data pipelines, interim dataset may be used in many different metrics &products. Each product may require different reference data/columns, so processing is kept to a minimum at this stage.