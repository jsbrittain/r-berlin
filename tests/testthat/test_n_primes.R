source("../../R/n_primes.R")
library(testthat)

test_that("testthat", {
  expect_equal(get_n_primes(2), c(2, 3))
  expect_type(get_n_primes(2), "double")
})
