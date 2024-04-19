test_that("le calcul des parts fonctionne", {
  expect_equal(part(2,3), 3.5)
  expect_equal(part(1,1), 2)
})


test_that("part gère bien les données non-conforme", {
  # expect_warning(val <- part(3,1))
  expect_true(is.na(part(3,1)))
  expect_true(is.na(part(0,1)))
})
