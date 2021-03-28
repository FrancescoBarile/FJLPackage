test_that("betahat_GD_R works", {
  expect_equal(betahat_GD_R(rnorm(ncol(mydataset)), as.matrix(cbind(Intercept=rep(1, nrow(mydataset)),mydataset%>%select(-Dep.var))), 
                                   as.matrix(mydataset%>%select(Dep.var)), 
                                   tolerance=0.001, maxit=1000, stepsize=1e-5), matrix(c(5,0.5, 0.2, 0.1), ncol=1, 
                                                                                          dimnames=list(c('Intercept', setdiff(colnames(mydataset),"Dep.var")),"Dep.var")), tolerance=0.1)
})

test_that("betahat_GD_R works", {
  expect_equal(matrix(betahat_GD_R(rnorm(ncol(mydataset)), as.matrix(cbind(Intercept=rep(1, nrow(mydataset)),mydataset%>%select(-Dep.var))), 
                            as.matrix(mydataset%>%select(Dep.var)), 
                            tolerance=0.001, maxit=1000, stepsize=1e-5)), 
               matrix(coef(lm(Dep.var ~ . , mydataset))), tolerance=0.1)
})