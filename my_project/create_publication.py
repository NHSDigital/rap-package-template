"""
Purpose of the script: organises the steps in a simple, easy-to-understand manner
that should be readable by anyone, even if they don't know python. In this way, 
we aim to reduce risk by make the code accessible to new staff.

In this template, we use the sys library for add inputs via command line

To use sys, open anaconda prompt and point to the root folder. For example 
suppose I want to input 10 in the command line: 
    
    > python .\my_project\create_publication.py 10
    
The expected output would be:
    This message shows that you have successfully imported the get_df_from_sql() function from the data connections module
    This message shows that you have successfully imported the write_df_to_sql() function from the data connections module
    This message shows that you have successfully imported the validation_checks() function from the preprocessing module
    This message shows that you have successfully imported params from the params module
    user parameter: 10

"""

# %%
import sys
from utilities import data_connections
from utilities import processing_steps
from params import params

def main():
    # check if data_connections module has been imported
    data_connections.get_df_from_sql()
    
    data_connections.write_df_to_sql()
    
    # check if processing_steps module has been imported
    processing_steps.validation_checks()
    
    # check if params file has been imported
    print(params['publication_version'])
    
    # check if user command line parameters have been imported
    for arg in sys.argv[1:]:
        print('user parameter: ' + arg)

if __name__ == "__main__":
    main()