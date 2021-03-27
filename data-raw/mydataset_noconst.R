## code to prepare `mydataset_noconst` dataset goes here
library(tibble)
set.seed(1)
n = 1000
beta0 = matrix(c(0.5, 0.2, 0.1), ncol=1)
x1 = rnorm(n)
x2 = rnorm(n)
x3 = rnorm(n)
x = cbind(x1, x2, x3)
y = as.numeric( x%*%beta0 + rnorm(n) )

mydataset_noconst = tibble(Dep.var=y, Reg.1=x1, Reg.2=x2, Reg.3=x3)
usethis::use_data(mydataset_noconst, overwrite = TRUE)
