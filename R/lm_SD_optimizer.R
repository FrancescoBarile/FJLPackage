#' Estimating Linear Models via Steepest Descent Optimization method (General)
#' 
#' lm_SD_optimizer is used to estimates the parameters of a Linear Regression model via 
#' an unconstrained optimization method called Steepest Descent Method. It is in the general version: 
#' extract the variables of interest from the dataset and generates the initial values of the coefficients other than the betahat_SD_R functionalities
#' 
#' @param formula [character] a symbolic description of the model to be fitted (as lm), with -1 if the intercept is not included
#' @param df [numeric] dataset containing the variables of interest
#' @param tolerance [numeric] tolerance level, stopping criteria of the algorithm (error<tolerance: stop)
#' @param maxit [numeric] maximum number of iterations, used if the stopping criteria is never matched
#' @param verbose [logical] indicating if the function write messages during the computation
#'
#' @return [list] betas estimated, regressors, response variable, formula of the model, and name of the method implemented  
#' @export

lm_SD_optimizer<-function(formula, df, tolerance, maxit, verbose) {
 
  data=data_xy(formula, df)
  y=as.matrix(data$Y)
  x=as.matrix(data$X)
  
  beta = rnorm(ncol(x))
  
  err=1
  t = 1
  if(verbose){
    while( ( (err>tolerance) & (t<=maxit) ) ){
      beta_old = beta
      gr = 2*t(x)%*%(x%*%beta-y)
      hess = 2*t(x)%*%x
      step = as.numeric( sum(gr^2)/( t(gr)%*%hess%*%gr ) )
      beta = beta - step*gr 
      err = max(abs(beta-beta_old))
      print(paste("error at iteration", t, ":", err))
      t = t+1
    }
  }
  else{
    while( ( (err>tolerance) & (t<=maxit) ) ){
      beta_old = beta
      gr = 2*t(x)%*%(x%*%beta-y)
      hess = 2*t(x)%*%x
      step = as.numeric( sum(gr^2)/( t(gr)%*%hess%*%gr ) )
      beta = beta - step*gr 
      err = max(abs(beta-beta_old))
      t = t+1
    }
  }
  output = list(beta_hat=beta, Y=data$Y, X=data$X, model_formula=formula, method="Steepest Descend")
  return(output)
}
