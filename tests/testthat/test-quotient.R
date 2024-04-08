test_that("quotient calcule correctement", {
  expect_equal(quotient(13000, 3000, 23000), 0.5)
  expect_equal(quotient(23000, 3000, 23000), 0)
  expect_equal(quotient(3000, 3000, 23000), 1)

})

test_that("quotient respecte les bornes", {
  expect_equal(quotient(100, 3000, 23000), 1)
  expect_equal(quotient(43000, 3000, 23000), 0)

})
