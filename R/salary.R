# Demonstration of 'mock' functions for testing
#
# Mocks allow us to override function calls that are 'within' other tested
# functions. This can be useful when the you want to test makes use of database
# look-ups, relies on date-time information, or is computationally expensive.
#
# Note that tests would normally go into a separate 'tests' folder, but have
# been included here alongside the function definitions for clarity. Due to this
# you will need to 'source' this file rather than clicking 'Run Tests' in RStudio.
#
# Here, we mock obtaining the Gross salary of employee #id from payroll - this
# function could conceivably make use of a database look-up (which is slow,
# relies on the database being online/available, and is liable to change).

GrossSalary <- function(id) {
  stopifnot(FALSE)  # Fail if this line is ever executed
}

NetSalary <- function(id, tax) {
  return(GrossSalary(id)*(1-tax))
}

test_that("salary", {
  local_mock(GrossSalary = function(id) 100000)
  expect_equal(NetSalary(123,.2), 80000)
})