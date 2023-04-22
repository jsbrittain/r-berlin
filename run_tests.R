if(!require("pacman")) install.packages("pacman")
pacman::p_load("testthat")

testthat::test_dir("tests/testthat")