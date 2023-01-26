
# function that takes a data frame and a list of column names as input and allows you to apply several formatting options to the specified columns:

dplyr_format_num <- function(data, columns, format, digits = 2) {
  require(dplyr)
  data %>%
    dplyr::mutate_at(dplyr::vars(columns), function(x) {
      if (format == "percent") {
        return(scales::percent(x, accuracy = digits))
      } else if (format == "comma") {
        return(scales::comma(x, accuracy = digits))
      } else if (format == "dollar") {
        return(scales::dollar(x, accuracy = digits))
      } else if (format == "date") {
        return(format(x, "%b-%y"))
      } else {
        return(x)
      }
    })
}