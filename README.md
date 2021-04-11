
# cpp

<!-- badges: start -->
<!-- badges: end -->

The goal of cpp is to provide user-friendly functions to estimate a Classical Linear Regression Model via two Unconstrained Optimization Methods: Steepest and Gradient Descend

## Installation

You can install the released version of cpp from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("cpp")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(cpp)
#we are going to check how lm_GD_optimizer  
lm_opt_GD_mtcars = lm_GD_optimizer(mpg ~ hp + wt, mtcars, tolerance=1e-3, 
                                   maxit=1000, stepsize=1e-2, verbose=T)
lm_opt_GD_mtcars 


#we are going to check how lm_SD_optimizer models fuel consumption by Gross horsepower (hp) and weight (wt) 
lm_opt_SD_mtcars = lm_SD_optimizer(mpg ~ hp + wt, mtcars, tolerance=1e-3, 
                                   maxit=1000, verbose=T)
lm_opt_SD_mtcars 
```

