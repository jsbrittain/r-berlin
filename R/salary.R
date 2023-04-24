# Demonstration of 'mock' functions for testing
#
# Note that tests would normally go into a separate 'tests' folder, but have
# been included here alongside the function definitions for clarity. Due to this
# you will need to 'source' this file rather than clicking 'Run Tests' in RStudio.

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
