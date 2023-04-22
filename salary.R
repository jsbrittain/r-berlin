GrossSalary <- function(id) {
  # Obtains its records from database
  assert(False)
}

NetSalary <- function(id, tax) {
  return(GrossSalary(id)*(1-tax))
}

test_that("salary", {
  local_mock(GrossSalary = function(x) 100000)
  expect_equal(NetSalary(352,.2), 80000)
})