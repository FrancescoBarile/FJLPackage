#' Title
#'
#' @param formula a formula specifying the model
#' @param df dataset containing the variables of interest
#' @param tolerance tolerance level 
#' @param maxit maximun number of iteration
#' @param stepsize learning parameter 
#' @param verbose should the function write messages during the computation?
#'
#' @return
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