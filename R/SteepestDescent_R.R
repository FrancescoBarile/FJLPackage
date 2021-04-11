#' Steepest Descent Optimization Method for Linear Models
#'
#' betahat_SD_R is used to estimates the beta vector of a linear Regression model via Steepest Descent
#'
#' @param beta [numeric] vector containing an initial guess for the beta vector
#' @param x [numeric] design matrix
#' @param y [numeric] response variable vector
#' @param tolerance [numeric] tolerance level, stopping criteria of the algorithm (error<tolerance: stop)
#' @param maxit [numeric] maximum number of iterations, used if the stopping criteria is never matched 
#'
#' @return [numeric] vector of beta parameters estimated
#' @export

betahat_SD_R <- function(beta, x, y, tolerance, maxit){
  hess = 2*t(x)%*%x
  err=1
  t=1
  while( ( (err>tolerance) & (t<=maxit) ) ){
    beta_old = beta
    gr=2*t(x)%*%(x%*%beta-y)
    step = as.numeric( sum(gr^2)/( t(gr)%*%hess%*%gr ) )
    beta = beta - step*gr 
    err = max(abs(beta-beta_old))
  }
  return(beta)
}