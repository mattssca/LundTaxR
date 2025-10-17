library(testthat)
library(LundTaxR)

test_that("classify_samples returns a list with expected components", {
  data("sjodahl_2017")
  result <- classify_samples(this_data = sjodahl_2017, log_transform = FALSE)
  expect_type(result, "list")
  expect_true("predictions_5classes" %in% names(result))
  expect_true("predictions_7classes" %in% names(result))
})
