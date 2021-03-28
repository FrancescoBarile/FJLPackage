test_that("betahat_SD_Cpp works", {
  expect_equal(betahat_SD_Cpp(rnorm(ncol(mydataset)), as.matrix(cbind(Intercept=rep(1, nrow(mydataset)),mydataset%>%select(-Dep.var))), 
                              as.matrix(mydataset%>%select(Dep.var)), 
                              tolerance=0.001), matrix(c(5,0.5, 0.2, 0.1), ncol=1), tolerance=0.1)
})

test_that("betahat_SD_Cpp works", {
  expect_equal(betahat_SD_Cpp(rnorm(ncol(mydataset)), as.matrix(cbind(Intercept=rep(1, nrow(mydataset)),mydataset%>%select(-Dep.var))), 
                              as.matrix(mydataset%>%select(Dep.var)), 
                              tolerance=0.001), 
               matrix(coef(lm(Dep.var ~ . , mydataset))), tolerance=0.1)
})