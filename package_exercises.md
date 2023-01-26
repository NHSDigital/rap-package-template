## Practice exercises

* Clone the template to your machine
* Install the package using the instuctions in the README
* Run an .R script called `my_name.R` in the `my_project/` folder
* Add a new module called `print_my_name.R` in the utilities module.
* Write a basic function in that module to print your name

```r
print_my_name <- function(name) {
  print(paste("My name is:", name))
}
```

* Import that function to the `my_name.R` file and run it. It should look something like this

```r
source("utilities/print_my_name.R")

print_my_name(name = 'Connor')
```

Please call for help if you get stuck. Getting these things set up first time can be fiddly so we are happy to help. Once you are up and running, it should be much easier.
