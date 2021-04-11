#' Estimation of Linear Regression model via Gradient Descent method
#'
#' betahat_GD_R is used to estimates the beta vector of a linear Regression model via 
#' an unconstrained optimization method called Gradient Descent Method
#'
#' @param beta [numeric] vector containing an initial guess for the beta vector
#' @param x [numeric] design matrix
#' @param y [numeric] response variable vector
#' @param tolerance [numeric] tolerance level, stopping criteria of the algorithm (error<tolerance: stop)
#' @param maxit [numeric] maximum number of iterations, used if the stopping criteria is never matched 
#' @param stepsize [numeric] learning parameter, to update the parameters at each iteration 
#'
#' @return [numeric] vector of beta parameters estimated
#' @export

betahat_GD_R <- function(beta, x, y, tolerance, maxit, stepsize) { 
  err=1
  t=1
  while( ( (err>tolerance) & (t<=maxit) ) ){
    beta_old=beta
    gr=2*t(x)%*%(x%*%beta-y)
    beta = beta - stepsize*gr 
    err=max(abs(beta-beta_old))
    t=t+1
  }
  return(beta)
}