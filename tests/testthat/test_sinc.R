source("../../R/sinc.R")
library(testthat)

test_that("sinc", {
  expect_equal(sinc(pi), 0)
  expect_type(sinc(pi), "double")
  expect_equal(sinc(0), 1)
})