***Repository owner: [Craig R Shenton](https://github.com/craig-shenton)***

***Email: craig.shenton@nhs.net***

***To contact me raise an issue on Github or via email and I will respond promptly.***

# rapr-package-template

An R/Quarto package template that can be adapted for RAP projects.


# What is a package?
You can learn all about packages and why they are useful in the community-of-practice [project structure and packaging](https://nhsdigital.github.io/rap-community-of-practice/training_resources/python/project-structure-and-packaging/) guide (*note:* this for python projects).

# Getting Started

## Clone repository
To clone the repository, please see our [community of practice page](https://nhsdigital.github.io/rap-community-of-practice/training_resources/git/using-git-collaboratively/).

## Set up environment
Set up an R virtual environment using `{renv}`:

1. Use `init()` to initialise a project. `renv` will discover the `R` packages used in your project, and install those packages into a private project library.

```bash
install.packages("renv")
renv::init()
```

2. Work in your project as usual, installing and upgrading `R` packages as required as your project evolves. Use `snapshot()` to save the state of your project library. The project state will be serialised into a file called `renv.lock`.

```bash
renv::snapshot()
```

Your `renv.lock` file should look something like this:
```lock
{
  "R": {
    "Version": "4.2.2",
    "Repositories": [
      {
        "Name": "CRAN",
        "URL": "https://cran.rstudio.com"
      }
    ]
  },
  "Packages": {
    "renv": {
      "Package": "renv",
      "Version": "0.16.0",
      "Source": "Repository",
      "Repository": "CRAN",
      "Hash": "c9e8442ab69bc21c9697ecf856c1e6c7",
      "Requirements": []
    }
  }
}
```

3. Use `restore()` to restore your project library from the state of your previously-created lockfile renv.lock.
    
```bash
renv::init()
```

For details, please see our [virtual environments in the community of practice page](https://nhsdigital.github.io/rap-community-of-practice/training_resources/python/virtual-environments/why-use-virtual-environments/) (*note:* this for python projects).

# Package structure:
```
rap-package-template
│   README.md
│
├───my_project
|   |   _targets.R <!-- run from utilities? -->
│   │   create_report.R
│   │   params.R
|   |   report_template.qmd
│   │
│   └───utilities
│       │   data_connections.R
│       │   field_definitions.R
│       │   processing_steps.R
|
├───reports
│   │
│   ├───input_profile
│   └───output_profile
│
└───tests
    ├───unittests
    │       │   test_data_connections.R
    │       │   test_field_definitions.R
    │       │   test_processing_steps.R
    │
    └───backtests
            test_compare_outputs.R
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
The [R package exercises](package_exercises.md) page list some steps you can follow to try adapting this package. 

# Link to your publication [To be modified by the user]
You should include a link to where your publication is published so people can easily see the outputs. Conversely, you should add a link in your publication to this repo's address on the public facing github.


# Licence [To be modified by the user]
The **XXXXXX** publication codebase is released under the MIT License.
The documentation is © Crown copyright and available under the terms of the [Open Government 3.0 licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).



