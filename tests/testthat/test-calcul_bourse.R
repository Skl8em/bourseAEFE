test_that("revenu_net_imp inverse quotite_post_cps hors des bornes", {
  set.seed(1)
  n <- 500
  salaire <- runif(n, 2e5, 3e6)
  scolarite <- runif(n, 5e5, 2e6)
  p <- part(sample(1:2, n, TRUE), sample(1:4, n, TRUE))
  ippa <- runif(n, 60, 130)
  tx <- runif(n, 0.004, 0.01)
  t_cps <- runif(n, 0, 0.15)

  q <- quotite_post_cps(salaire, scolarite, p, ippa, tx, t_cps)
  interieur <- q > 0 & q < 1

  expect_gt(sum(interieur), 50)
  expect_equal(
    revenu_net_imp(q, scolarite, p, ippa, tx, t_cps)[interieur],
    salaire[interieur]
  )
})
