test_that("cps_inv marche", {
  expect_equal(quotite_theorique_imp(cps(1, 0.05), 0.05), 1)
  expect_equal(quotite_theorique_imp(cps(0.95, 0.05), 0.05), 0.95)
  expect_equal(quotite_theorique_imp(cps(0.9, 0.05), 0.05), 0.9)
  expect_equal(quotite_theorique_imp(cps(0.85, 0.05), 0.05), 0.85)
  expect_equal(quotite_theorique_imp(cps(0.8, 0.05), 0.05), 0.8)
  expect_equal(quotite_theorique_imp(cps(0.5, 0.05), 0.05), 0.5)
  expect_equal(quotite_theorique_imp(0.5, 0.05), 0.55)
  expect_equal(quotite_theorique_imp(0.85, 0.1), 0.9)

})


