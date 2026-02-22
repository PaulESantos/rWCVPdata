test_that("wcvp_version returns expected format", {
  expect_type(wcvp_version(), "character")
  expect_match(wcvp_version(long = FALSE), "^\\d+$")
  expect_match(wcvp_version(long = TRUE), "^Version \\d+ \\(\\d{2} [A-Za-z]{3} \\d{4}\\)$")
})

test_that("wcvp_check_version behaves correctly", {
    # Mocking get_upload_date_ to avoid network calls and be predictable
    # Note: local_mocked_bindings is the testthat 3 way
    withr::local_envvar(R_TESTS = "")

    # Test when up to date
    local_mocked_bindings(
        get_upload_date_ = function() metadata$upload_date
    )
    expect_true(wcvp_check_version(silent = TRUE))

    # Test when out of date
    local_mocked_bindings(
        get_upload_date_ = function() "2099-01-01"
    )
    expect_false(wcvp_check_version(silent = TRUE))
    expect_warning(wcvp_check_version(silent = FALSE), "not the most recent version")
})
