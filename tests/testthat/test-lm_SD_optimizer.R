test_that("lm_SD_optimizer works", {
  expect_equal(matrix(lm_SD_optimizer(Dep.var ~ . , mydataset, tolerance=1e-3, verbose=T)$beta_hat), 
               matrix(coef(lm(Dep.var ~ . , mydataset))), tolerance=0.1 )
})

test_that("lm_SD_optimizer works", {
  expect_equal(lm_SD_optimizer(Dep.var ~ . , mydataset, tolerance=1e-3, verbose=T)$beta_hat, 
               matrix(c(5,0.5, 0.2, 0.1), ncol=1, 
                      dimnames=list(c('Intercept', setdiff(colnames(mydataset),"Dep.var")),"Dep.var")), tolerance=0.1 )
})