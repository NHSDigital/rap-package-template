***Warning - this repository is a snapshot of a repository internal to NHS Digital. This means that links to videos and some URLs may not work.***

***Repository owner: [NHS Digital Analytical Services](https://github.com/NHSDigital/data-analytics-services)***

***Email: datascience@nhs.net***

***To contact us raise an issue on Github or via email and will respond promptly.***

# rap-package-template

A python package template that can be adapted for RAP projects.


# What is a package?
You can learn all about packages and why they are useful in the community-of-practice [project structure and packaging](https://github.com/NHSDigital/rap-community-of-practice/blob/main/python/project-structure-and-packaging.md) guide.

# Getting Started

## Clone repository
To clone repository, please see our [community of practice page](https://github.com/NHSDigital/rap-community-of-practice/blob/main/development-approach/02_using-git-collaboratively.md).

## Set up environment
There are two options to set up the python enviroment:
1. Pip using `requirements.txt`.
2. Conda using `environment.yml`.

Users would need to delete as appropriate which set they do not need. For details, please see our [virtual environments in the community of practice page](https://github.com/NHSDigital/rap-community-of-practice/blob/main/python/virtual-environments.md).


### Option 1: To run pip
Run the following command in Terminal or VScode to set up the package:
```
    python setup.py install
    pip install -e .
    pip install -r requirements.txt
```

### Option 2: To run conda
Use Anaconda Prompt for the following steps:

1. Create the environment from the `environment.yml` file:
```
    conda env create -f environment.yml
```

The first line of the `.yml` file sets the new environment's name. In this template, the name is `rap`.

2. Activate the new environment: 
```
    conda activate rap
```

3. Verify that the new environment was installed correctly:
```
   conda env list
```

# Package structure:
```
rap-package-template
│   README.md
│
├───my_project
│   │   create_publication.py
│   │   params.py
│   │
│   └───utilities
│       │   data_connections.py
│       │   field_definitions.py
│       │   processing_steps.py
|
├───reports
│   │
│   ├───input_profile
│   └───output_profile
│
└───tests
    ├───unittests
    │       │   test_data_connections.py
    │       │   test_field_definitions.py
    │       │   test_processing_steps.py
    │
    └───backtests
            test_compare_outputs.py
```
Some things to notice about this structure:

* In the repository there are two files: `create_publication.py` and `params.py`. These top level files are the highest level of abstraction and should be the main place where users interact with the code. 

    * The `params.py` file contains all of the parameters that we expect to change frequently, e.g. input data. 
    * The `create_publication.py` file organises the steps in a simple, easy-to-understand manner that should be readable by anyone, even if they don't know python. In this way, we aim to reduce risk by make the code accessible to new staff. 

* The next level down contains the meaty parts of the code. By organising the code into logical sections, we make it easier to understand but also to maintain and test. Moreover, tucking the complex code out of the way means that users don't need to understand everything about the code all at once. 
    * The `data_connections.py` file handles reading data in and writing data back out. 
    * The `field_definitions.py` file contains the definitions for each of the fields (columns) derived in the process. By abstracting these definitions out of the code and making them reuseable, we achieve some great benefits. First, it becomes much easier to maintain. When the specifications change next year, we only need to make the change in one location. Next, it becomes much easier to test. We write unit tests for each of these definitions and can then reuse these definitions in many places without increasing risk. 
    * The `processing_steps.py` file contains the core business logic. 

Note that we never store passwords or any sensitive credentials in the repo to prevent the situation where it can mistakenly committed into the git. There are several ways to deal with the secret, keys and passwords such as using Git Hooks or final cleansing process before publishing. 
<br/><br/>

# Adapting the package
You can adapt the package to meet your own needs. The most obvious change would be to change the directory name and the name of the place where the code is kept. For example, if you were producing the [National Diabetes Audit (NDA)](https://github.com/NHSDigital/national-diabetes-audit) you might change the repo to look like this:
```
national-diabetes-audit
│   README.md
│
├───national_diabetes_audit
│   │   create_publication.py
│   │   params.py
```
The same change applied to the [Smoking, Drinking, and Drugs (SDD)](https://digital.nhs.uk/data-and-information/publications/statistical/smoking-drinking-and-drug-use-among-young-people-in-england) publication might look like this: 
```
smoking-drinking-drugs
│   README.md
│
├───smoking_drinking_drugs
│   │   create_publication.py
│   │   params.py
```
The [python package exercises](package_exercises.md) page list some steps you can follow to try adapting this package. 

# Link to your publication [To be modified by the user]
You should include a link to where your publication is published so people can easily see the outputs. Conversely, you should add a link in your publication to this repo's address on the public facing github.


# Licence [To be modified by the user]
The **XXXXXX** publication codebase is released under the MIT License.
The documentation is © Crown copyright and available under the terms of the [Open Government 3.0 licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).



