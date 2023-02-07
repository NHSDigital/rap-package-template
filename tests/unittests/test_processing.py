"""
Template of a unit test script


To run this test requires the following step:
        1) Open Anaconda prompt and set the directory to the project folder
        2) Enter:
            >pytest 
        and run
"""

import pytest

from src.processing.clean import *

# example
def test_convert_date_to_year():
    """
    Testing convert_date_to_year function.
    """
    df = pd.DataFrame({'id': [1, 2, 3], 'date': ['2005-01-01', '2015-02-03', '1999-01-01']})

    actual = convert_date_to_year(df['date'])

    expected = ['2005', '2015', '1999']

    assert actual == expected, "Values don't match!"
