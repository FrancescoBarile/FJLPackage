test_that("multiplication works", {
  expect_equal(mean((y_pred(Dep.var~.Reg1,lm_GD_optimizer(Dep.var~.Reg1,mydataset,1e-5,1000,1e-5,F),mydataset)$Dep.var_pred_GD-mydataset$Dep.var)^2),1.1,tolerance=0.1)
})
