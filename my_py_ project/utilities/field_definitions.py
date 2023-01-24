"""
Purpose of the script: contains the definitions for each of the fields 
(columns) derived in the process. By abstracting these definitions out of the 
code and making them reuseable, we achieve some great benefits. First, it 
becomes much easier to maintain. When the specifications change next year, we 
only need to make the change in one location. Next, it becomes much easier to 
test. We write unit tests for each of these definitions and can then reuse 
these definitions in many places without increasing risk.

For more information see https://github.com/NHSDigital/rap-community-of-practice/blob/d8ffe2decd737c594222565423fe31d87d590a12/development-approach/05_unit-testing-field-definitions.md#field-definitions-and-how-to-use-them
"""
aggregate_fields = (None)