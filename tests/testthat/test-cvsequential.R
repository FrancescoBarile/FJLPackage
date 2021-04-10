test_that("test the cvsequencial function", {
  expect_equal(cvsequencial(5,Dep.var~.Reg1,mydataset,1e-5,1000,1e-5,T), 1.1,tolerance=0.1)
})
