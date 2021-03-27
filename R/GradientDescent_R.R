#' betahat_GD_R
#'
#'This function estimates the beta vector of a linear Regression model via 
#'gradient descend method
#'
#' @param beta numeric vector containing an initial guess for the beta vector
#' @param x design matrix
#' @param y response variable vector
#' @param tolerance tolerance level 
#' @param maxit maximun number of iteration
#' @param stepsize learning parameter
#'
#' @return
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