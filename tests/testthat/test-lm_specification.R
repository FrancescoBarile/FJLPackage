test_that("lm.model_spec works for variables name", {
  expect_equal(lm.model_spec(Dep.var ~ ., mydataset)$var_names, 
               tibble(type=c('Dependent', 'Regressor 1', 'Regressor 2', 'Regressor 3'),
                      var_name=c('Dep.var', '.Reg1', 'Reg.2', 'Reg3.')))
})

test_that("lm.model_spec works for intercept", {
  expect_equal(lm.model_spec(Dep.var ~ ., mydataset)$intercept, TRUE)
})