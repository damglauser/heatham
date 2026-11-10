test_that("get_max_temperature returns the correct temperature", {

  expect_equal(
    get_max_temperature("2024-07-15"),
    25.9
  )

})

test_that("get_max_temperature returns a message if no temperature is available", {

  expect_equal(
    get_max_temperature("2024-01-01"),
    "There is no max. temperature available for the 1st of January 2024"
  )

})

test_that("get_max_temperature handles invalid dates", {

  expect_error(
    get_max_temperature("not-a-date")
  )

})
