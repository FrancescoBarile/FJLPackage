test_that("lm.model_spec works for variables name", {
  expect_equal(lm.model_spec(Dep.var ~ ., mydataset)$var_names, 
               tibble(type=c('Dependent', 'Regressor 1', 'Regressor 2', 'Regressor 3'),
                      var_name=c('Dep.var', '.Reg1', 'Reg.2', 'Reg3.')))
})

test_that("lm.model_spec works for intercept", {
  expect_equal(lm.model_spec(Dep.var ~ ., mydataset)$intercept, TRUE)
})


test_that("lm.model_spec works for variables name on mtcars", {
  expect_equal(lm.model_spec(mpg ~ hp + wt -1, mtcars)$var_names, 
               tibble(type=c('Dependent', 'Regressor 1', 'Regressor 2'),
                      var_name=c('mpg', 'hp', 'wt')))
})

test_that("lm.model_spec works for intercept on mtcars", {
  expect_equal(lm.model_spec(mpg ~ hp + wt -1, mtcars)$intercept, FALSE)
})