test_that("lm_GD_optimizer works", {
  expect_equal(matrix(lm_GD_optimizer(Dep.var ~ . , mydataset, tolerance=1e-3, maxit=1000, stepsize=1e-5, verbose=T)$beta_hat), 
               matrix(coef(lm(Dep.var ~ . , mydataset))), tolerance=0.1 )
})

test_that("lm_GD_optimizer works", {
  expect_equal(lm_GD_optimizer(Dep.var ~ . , mydataset, tolerance=1e-3, maxit=1000, stepsize=1e-5, verbose=T)$beta_hat, 
               matrix(c(5,0.5, 0.2, 0.1), ncol=1, 
                      dimnames=list(c('Intercept', setdiff(colnames(mydataset),"Dep.var")),"Dep.var")), tolerance=0.1 )
})

test_that("lm_GD_optimizer works", {
  expect_equal(lm_GD_optimizer(Dep.var ~ . , mydataset, tolerance=1e-3, maxit=1000, stepsize=1e-2, verbose=T), 
               "The solution of the OLS estimate diverges. Please try to lower the learning parameter (stepsize)")
})