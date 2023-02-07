"""
This script checks whether pairs of CSVs are the same as each other.

To use:
    files_to_compare: [(String, String)] is imported from params.py. It contains pairs of filenames to be tested.
    OUTPUT_DIR: String and GROUND_TRUTH_DIR: String are also imported from params.py. They are the respective locations of the pair of files.

"""

import pandas as pd
import pathlib2
from backtesting_params import bt_params

for (target_filename, gtruth_filename) in bt_params['files_to_compare']:
    target_df = pd.read_csv(pathlib2.Path(bt_params['OUTPUT_DIR']) / target_filename)
    gtruth_df = pd.read_csv(pathlib2.Path(bt_params['GROUND_TRUTH_DIR']) / gtruth_filename)

    print(f"\n Testing file: {gtruth_filename} against {target_filename}")

    try:
        # test csvs have the same number of rows and cols       
        assert target_df.shape == gtruth_df.shape
        print(f"\nTest 1 status: PASS \nTest 1 Details: CSV ground truth: {gtruth_filename} and CSV output: {target_filename} have the same number of rows and cols.\n")
    except AssertionError:
        print(f"Test 1 status: FAILED \nTest 1 Details: Rows, cols {target_df.shape} in {target_filename} is different to {gtruth_df.shape} in {gtruth_filename}.\n")

    try:
        #test the columns have the same names and same order
        assert target_df.columns.tolist() == gtruth_df.columns.tolist()
        print(f"Test 2 status: PASS \nTest 2 Details: CSV ground truth: {gtruth_filename} and CSV output: {target_filename} have the same column names and order.\n")
    except AssertionError:
        print(f"Test 2 status: FAILED \nTest 2 Details: {target_filename} has different column names to {gtruth_filename}. {target_df.columns.tolist()} compared to {gtruth_df.columns.tolist()}.\n")

    try:
        # test the contents of each column are the same
        for each_col in gtruth_df.columns:
            assert (gtruth_df[each_col].equals(target_df[each_col]))
        print(f"Test 3 status: PASS \nTest 3 Details: CSV ground truth: {gtruth_filename} and CSV output: {target_filename} have the same column contents.\n")
    except AssertionError:
        print(f'Test 3 status: FAILED \nTest 3 Details: The contents in col {each_col} are different between {target_filename} and {gtruth_filename}.')
