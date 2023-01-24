
# This test function tests the format_columns function with three different formatting options: "percent", "comma", and "dollar". For each test, it compares the expected output to the actual output using the expect_equal() function.

# Define the unit test
# -------------------------------------------------------------------------
test_that("format_columns formats columns correctly", {
  data <- data.frame(decimal = c(0.5, 0.6, 0.7),
                     number = c(10000, 20000, 30000),
                     date = c("2022-01", "2022-02", "2022-03"))

  # Test formatting as percentages
  expected_output <- data.frame(decimal = c("50%", "60%", "70%"),
                                number = c(10000, 20000, 30000),
                                date = c("2022-01", "2022-02", "2022-03"))
  actual_output <- dplyr_format_num(data, c("decimal"), "percent", digits = 1)
  expect_equal(actual_output, expected_output)

  # Test formatting with commas
  expected_output <- data.frame(decimal = c(0.5, 0.6, 0.7),
                                number = c("10,000", "20,000", "30,000"),
                                date = c("2022-01", "2022-02", "2022-03"))
  actual_output <- dplyr_format_num(data, c("number"), "comma", digits = 1)
  expect_equal(actual_output, expected_output)

  # Test formatting as currency
  expected_output <- data.frame(decimal = c(0.5, 0.6, 0.7),
                                number = c("$10,000", "$20,000", "$30,000"),
                                date = c("2022-01", "2022-02", "2022-03"))
  actual_output <- dplyr_format_num(data, c("number"), "dollar", digits = 1)
  expect_equal(actual_output, expected_output)
})