"""
Purpose of script: contains data transformations tailored to our publication
"""
import pandas as pd
import numpy as np
import logging

logger = logging.getLogger(__name__)

def gp_count_by_region(gp_df: pd.DataFrame) -> pd.DataFrame:
    """Counts the number of active and inactive GPs in each region 
    and creates a dataframe from that info
    
    Parameters: 
        gp_df -> pd.dataframe, containing records for each GP in Scotland
        
    Returns:
        region_df -> pd.dataframe, containing records for each region in Scotland
    """
    logger.info("Counting number of active and inactive GPs in each region.")

    region_df = gp_df.groupby('REGION', as_index=False)[['OPENED', 'CLOSED']].count()

    region_df.rename(columns={'OPENED': 'ACTIVE', 'CLOSED': 'INACTIVE'}, inplace=True)

    region_df['ACTIVE'] = region_df['ACTIVE'] - region_df['INACTIVE']

    return region_df

def calculate_mean_years(region_df: pd.DataFrame, gp_df: pd.DataFrame) -> pd.DataFrame:
    """Calculates the mean average number of years that GPs (in each region) have remained active 
    then creates a column for that data
    
    Parameters: 
        region_df -> pd.dataframe
        gp_df -> pd.dataframe
        
    Returns:
        region_df -> pd.dataframe, containing a 'AVG YEARS' column
    """
    logger.info("Calculating the average number of years that GPs have remained actived.")

    mean_years_df = gp_df.groupby('REGION', as_index=False)[['YEARS']].mean()

    region_df = pd.merge(region_df, mean_years_df, how='inner', on=['REGION'])

    region_df.rename(columns={'YEARS': 'MEAN YEARS'}, inplace=True)

    #region_df['MEAN YEARS'] = gp_df.groupby('REGION', as_index=False)['YEARS'].transform(np.mean)

    return region_df
