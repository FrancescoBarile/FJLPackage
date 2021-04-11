#' Estimating Linear Models via Gradient Descent Optimization method (General)
#' 
#' lm_GD_optimizer is used to estimates the parameters of a Linear Regression model via 
#' an unconstrained optimization method called Gradient Descent Method. It is in the general version: 
#' extract the variables of interest from the dataset and generates the initial values of the coefficients other than the betahat_GD_R functionalities
#' 
#' @param formula [character] a symbolic description of the model to be fitted (as lm), with -1 if the intercept is not included
#' @param df [numeric] dataset containing the variables of interest
#' @param tolerance [numeric] tolerance level, stopping criteria of the algorithm (error<tolerance: stop)
#' @param maxit [numeric] maximum number of iterations, used if the stopping criteria is never matched
#' @param stepsize [numeric] learning parameter, to update the parameters at each iteration 
#' @param verbose [logical] indicating if the function write messages during the computation
#'
#' @return [list] betas estimated, regressors, response variable, formula of the model, and name of the method implemented  
#'
#' @export

lm_GD_optimizer<-function(formula, df, tolerance, maxit, stepsize, verbose){
 
  data=data_xy(formula, df)
  y=as.matrix(data$Y)
  x=as.matrix(data$X)
  
  beta=rnorm(ncol(x))
  
  error=1
  t=1
  tryCatch({
    if(verbose){
      while( ( (error>tolerance) & (t<=maxit) ) ){
        beta_old = beta
        gr = 2*t(x)%*%(x%*%beta-y)
        beta = beta - stepsize*gr 
        error = max(abs(beta-beta_old))
        print(paste("error at iteration", t, ":", error))
        t = t+1
      }
    }
    else{
      while( ( (error>tolerance) & (t<=maxit) ) ){
        beta_old = beta
        gr = 2*t(x)%*%(x%*%beta-y)
        beta = beta - stepsize*gr 
        error = max(abs(beta-beta_old))
        t = t+1
      }
    }
    output = list(beta_hat=beta, Y=data$Y, X=data$X, model_formula=formula, method="Gradient Descend")
  }, 
  error = function(err) {
    print(err)
    print(beta_old)
    output="The solution of the OLS estimate diverges. Please try to lower the learning parameter (stepsize)"
    return(output)
  }
  )
}