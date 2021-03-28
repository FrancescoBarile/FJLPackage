#' Title
#'
#' @param beta numeric vector containing an initial guess for the beta vector
#' @param x design matrix
#' @param y response variable vector
#' @param tolerance tolerance level 
#'
#' @return
#' @export

betahat_SD_R <- function(beta, x, y, tolerance, maxit){
  hess = 2*t(x)%*%x
  err=1
  while( ( (err>tolerance) & (t<=maxit) ) ){
    beta_old = beta
    gr=2*t(x)%*%(x%*%beta-y)
    step = as.numeric( sum(gr^2)/( t(gr)%*%hess%*%gr ) )
    beta = beta - step*gr 
    err = max(abs(beta-beta_old))
  }
  return(beta)
}