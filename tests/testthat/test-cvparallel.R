test_that("test the cvparallel function", {
  expect_equal(cvparallel(50,Dep.var~.Reg1,mydataset,1e-5,1000,1e-5,T,4),1.1,tolerance=0.1)
})
