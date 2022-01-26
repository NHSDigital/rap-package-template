"""
Template of a unit test script


To run this test requires the following step:
        1) Open Anaconda prompt and set the directory to the project folder
        2) Enter:
            >pytest 
        and run
"""

import pytest

from my_project.utilities import processing_steps

def test_derived_something():
    """
    A template to create a pytest def
    
    """
    ground_truth = 'output'
    
    output_from_function = processing_steps.derived_something()
    
    assert ground_truth == output_from_function