test_that("cps calculer correctement", {
  expect_equal(cps(1, 0.1), 1)
  expect_equal(cps(0.95, 0.1), 0.95 - 0.1 * 0.25)
  expect_equal(cps(0.9, 0.1), 0.85)
  expect_equal(cps(0.85, 0.1), 0.85 - 0.1 * 0.75)
  expect_equal(cps(0.8, 0.1), 0.7)
})
