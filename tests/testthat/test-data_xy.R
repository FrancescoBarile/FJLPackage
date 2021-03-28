test_that("data_xy works for Y", {
  expect_equal(data_xy(Dep.var ~ ., mydataset)$Y, mydataset%>%select(Dep.var))
})

test_that("data_xy works for X", {
  expect_equal(data_xy(Dep.var ~ ., mydataset)$X%>%select(-Intercept), mydataset%>%select(-Dep.var))
})