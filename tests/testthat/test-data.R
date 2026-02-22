test_that("wcvp_names matches metadata", {
  expect_s3_class(wcvp_names, "data.frame")
  expect_equal(nrow(wcvp_names), metadata$name_rows)
  expect_equal(ncol(wcvp_names), metadata$name_col)
})

test_that("wcvp_distributions matches expected format", {
  expect_s3_class(wcvp_distributions, "data.frame")
  expect_true(nrow(wcvp_distributions) > 0)
  expect_true(ncol(wcvp_distributions) > 0)
})

test_that("spatial data objects have correct classes", {
  skip_if_not_installed("sf")
  expect_s3_class(wgsrpd3, "sf")
  expect_s3_class(coast, "sfc")
  expect_s3_class(wgsrpd3_pacific, "sf")
  expect_s3_class(coast_pacific, "sfc")
})
