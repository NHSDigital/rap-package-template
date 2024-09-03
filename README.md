# RAP repository template

> [!WARNING]
> This repository may contain references internal to NHS England that cannot be accessed publicly

> Describe your project in 1-3 sentences.

A template Python repository that can be adapted for RAP projects.

_A **repository** is something that contains all of your project's files and and each file's revision history._

## Link to publication

> Include a link to where your publication is published.

## Contact
**This repository is maintained by NHS England Data Science Team**.
> _To contact us raise an issue on Github or via [email](mailto:england.rapchampions@nhs.net)._
>
> See our (and our colleagues') other work here: [NHS England Analytical Services](https://github.com/NHSDigital/data-analytics-services)

## Description

> Provide more detailed overview of the project, including (if relevant) a description of the publication process.

This repository is intended to function as a template for Python RAP projects at NHS England.

You can learn more about project structure and why it's important in the ['project structure and packaging guide'](https://nhsdigital.github.io/rap-community-of-practice/training_resources/python/project-structure-and-packaging/) of the RAP community of practice Github repo, a central source of RAP knowledge.

_You can edit any part of this document. The licence section **must be edited** before publishing this repository publicly. For more information about publishing your project please see the ['how to publish your code in the open' guide](https://nhsdigital.github.io/rap-community-of-practice/implementing_RAP/how-to-publish-your-code-in-the-open/)._

## Prerequisites

> If applicable, list the items a user needs to be able to use your repository, such as a certain version of a programming language. It can be useful to link to documentation on how to install these items.

* Python (> 3.0)

## Getting Started

> Tell the user how to get started (using a numbered list can be helpful). List one action per step with example code if possible.

1. Clone the repository. To learn about what this means, and how to use Git, see the [Git guide](https://nhsdigital.github.io/rap-community-of-practice/training_resources/git/using-git-collaboratively/).

```
git clone <insert URL>
```

2. Set up your environment, _either_ using [pip](https://pypi.org/project/pip/) or [conda](https://www.anaconda.com/). For more information on how to use virtual environments and why they are important,. see the [virtual environments guide](https://nhsdigital.github.io/rap-community-of-practice/training_resources/python/virtual-environments/why-use-virtual-environments/).

### Using pip
```
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
```
For Visual Studio Code it is necessary that you change your default interpreter to the virtual environment you just created .venv. To do this use the shortcut Ctrl-Shift-P, search for Python: Select interpreter and select .venv from the list.
### Using conda
The first line of the `environment.yml` file sets the new environment's name. In this template, the name is `rap_template`- you should change this in the `environment.yml` file, as well as the following code, to the name of your project.
```
conda env create -f environment.yml
conda activate <environment_name>
```
3. _Optional_: In the terminal, change the directory into the cloned repos' directory, and run the example publication script:
```
cd rap-package-template
python examples/example_create_publication.py
```

## Project structure

> Provide the user with an outline of your repository structure. This template is primarily designed for publications teams at NHS England. Projects with different requirements (e.g. more complex documentation and modelling) should look to [DrivenData's cookiecutter project structure](https://drivendata.github.io/cookiecutter-data-science/#directory-structure), as well as our [Community of Practice](https://nhsdigital.github.io/rap-community-of-practice/training_resources/python/project-structure-and-packaging/) for guidance.

```text
|   .gitignore                        <- Files (& file types) automatically removed from version control for security purposes
|   config.toml                       <- Configuration file with parameters we want to be able to change (e.g. date)
|   environment.yml                   <- Conda equivalent of requirements file
|   requirements.txt                  <- Requirements for reproducing the analysis environment
|   pyproject.toml                    <- Configuration file containing package build information
|   LICENCE                           <- License info for public distribution
|   README.md                         <- Quick start guide / explanation of your project
|
|   create_publication.py             <- Runs the overall pipeline to produce the publication
|
+---src                               <- Scripts with functions for use in 'create_publication.py'. Contains project's codebase.
|   |       __init__.py               <- Makes the functions folder an importable Python module
|   |
|   +---utils                     <- Scripts relating to configuration and handling data connections e.g. importing data, writing to a database etc.
|   |       __init__.py               <- Makes the functions folder an importable Python module
|   |       file_paths.py             <- Configures file paths for the package
|   |       logging_config.py         <- Configures logging
|   |       data_connections.py       <- Handles data connections i.e. reading/writing dataframes from SQL Server
|   |
|   +---processing                    <- Scripts with modules containing functions to process data i.e. clean and derive new fields
|   |       __init__.py               <- Makes the functions folder an importable Python module
|   |       clean.py                  <- Perform cleaning and wrangling processes
|   |       derive_fields.py          <- Create new field definitions, columns, derivations.
|   |
|   +---data_ingestion                <- Scripts with modules containing functions to preprocess read data i.e. perform validation/data quality checks, other preprocessing etc.
|   |       __init__.py               <- Makes the functions folder an importable Python module
|   |       preprocessing.py          <- Perform preprocessing, for example preparing your data for metadata or data quality checks.
|   |       validation_checks.py      <- Perform validation checks e.g. a field has acceptable values.
|   |
|   +---data_exports
|   |       __init__.py               <- Makes the functions folder an importable Python module
|   |       write_excel.py            <- Populates an excel .xlsx template with values from your CSV output.
|   |
+---sql                               <- SQL scripts for importing data
|       example.sql
|
+---templates                         <- Templates for output files
|       publication_template.xlsx
|
+---tests
|   |       __init__.py               <- Makes the functions folder an importable Python module
|   |
|   +---backtests                     <- Comparison tests for the old and new pipeline's outputs
|   |       backtesting_params.py
|   |       test_compare_outputs.py
|   |       __init__.py               <- Makes the functions folder an importable Python module
|   |
|   +---unittests                     <- Tests for the functional outputs of Python code
|   |       test_data_connections.py
|   |       test_processing.py
|   |       __init__.py               <- Makes the functions folder an importable Python module
```

### `root`

In the highest level of this repository (known as the 'root'), there is one Python file: `create_publication.py`. This top level file should be the main place where users interact with the code, where you store the steps to create your publication.

This file currently runs a set of example steps using example data.

### `src`

This directory contains the meaty parts of the code. By organising the code into logical sections, we make it easier to understand, maintain and test. Moreover, tucking the complex code out of the way means that users don't need to understand everything about the code all at once.

* `data_connections.py` handles reading data in and writing data back out.
* `processing` folder contains the core business logic.
* `utils` folder contains useful reusable functions (e.g. to set up logging, and importing configuration settings from `config.toml`)
* `write_excel.py` contains functions relating to the final part of the pipeline, any exporting or templating happens here. This is a simplistic application of writing output code to an Excel spreadsheet template (.xlsx). A good example of this application is: [NHS sickness absence rates publication](https://github.com/NHSDigital/absence-rates). We highly recommend to use [Automated Excel Production](https://nhsd-git.digital.nhs.uk/data-services/analytics-service/iuod/automated-excel-publications) for a more in depth Excel template production application.

## Adapting for your project

> Help users configure the repository for their needs. Note that the GitHub/GitLab differentiation is not a usual requirement for a README.

### On GitHub

The [version of this repository on GitHub](https://github.com/NHSDigital/rap-package-template) is out-of-date and will be updated shortly. You are able to create your own GitHub repository from the GitHub version of this template automatically by clicking 'Use this template'.

### On GitLab

Unfortunately the [ability to create a project from template](https://docs.gitlab.com/ee/user/project/working_with_projects.html#create-a-project-from-a-custom-template) is not available on the NHS England GitLab, so the process of using this template is rather manual.

There are several workaround to use this template for your project on GitLab. One method is detailed below:

1. Clone this repository, making sure to replace `<project name>` in the snippet below to the name of your project, **not using any spaces**. To learn about what this means, and how to use Git, see the [Git guide](https://nhsdigital.github.io/rap-community-of-practice/training_resources/git/using-git-collaboratively/).

        git clone https://nhsd-git.digital.nhs.uk/data-services/analytics-service/iuod/rap-repository-template.git <project_name>

2. Change directory into this folder

        cd <project_name>

3. Delete the `.git` file (this removes the existing file revision history)

        rmdir /s .git

4. Initialise git (this starts tracking file revision history)

        git init
5. Add the files in the repo to revision history and make the initial commit

        git add .
        git commit -m "Initial commit"
6. Create a new blank repository for your project on GitLab
7. Add the URL of this new repository to your template repo

        git remote set-url origin <insert URL>
8. Push to GitLab

        git push -u origin main

-----------

## Licence

> The [LICENCE](/LICENCE) file will need to be updated with the correct year and owner

Unless stated otherwise, the codebase is released under the MIT License. This covers both the codebase and any sample code in the documentation.

Any HTML or Markdown documentation is [© Crown copyright](https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/) and available under the terms of the [Open Government 3.0 licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

## Acknowledgements
- [Connor Quinn](https://github.com/connor1q)
- [Sam Hollings](https://github.com/SamHollings)
- [Maakhe Ndhlela](https://github.com/maakhe)
- [Harriet Sands](https://github.com/harrietrs)
- [Xiyao Zhuang](https://github.com/xiyaozhuang)
- [Helen Richardson](https://github.com/helrich)
- [The RAP team](https://github.com/NHSDigital/rap-community-of-practice)!
