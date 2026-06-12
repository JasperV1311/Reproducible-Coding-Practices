source(file.path("..", "..", "functions.R"))
library(testthat)

test_that("convert_binary converts yes/no correctly", {
  input <- c("yes", "no", "yes", "no")
  
  expected <- c(1L, 0L, 1L, 0L)
  
  expect_equal(
    convert_binary(input),
    expected
  )
})

test_that("convert_binary handles unexpected values as 0", {
  input <- c("yes", "no", "maybe")
  
  expected <- c(1L, 0L, 0L)
  
  expect_equal(
    convert_binary(input),
    expected
  )
})

test_that("convert_ordinal maps categories correctly", {
  input <- c("no", "Sometimes", "Frequently", "Always")
  
  expected <- c(0, 1, 2, 3)
  
  expect_equal(
    convert_ordinal(input),
    expected
  )
})

test_that("convert_ordinal respects correct ordering", {
  input <- c("Always", "no", "Frequently", "Sometimes")
  
  expected <- c(3, 0, 2, 1)
  
  expect_equal(
    convert_ordinal(input),
    expected
  )
})

test_that("convert_ordinal returns NA for unknown values", {
  input <- c("no", "Sometimes", "invalid")
  
  result <- convert_ordinal(input)
  
  expect_true(is.na(result[3]))
})