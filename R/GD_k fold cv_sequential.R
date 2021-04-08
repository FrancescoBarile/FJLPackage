#' Title cvsequencial
#' 
#' ## using sequential method to calculate the k-fold crossing validation

#' @param k k-fold cross validation
#' @param formula a formula specifying the model
#' @param df dataset containing the variables of interest
#' @param tolerance tolerance level 
#' @param maxit maximun number of iteration
#' @param stepsize learning parameter 
#' @param verbose should the function write messages during the computation?
#'
#' @import dplyr
#' @import tidyr
#' @import tibble
#' @import stringr
#' @returns 
#' @export
#' 

###### using sequential method 

#### divide the data into k parts
### where k means k-fold cross validation

cvsequencial<-function(k,formula, df, tolerance, maxit, stepsize, verbose){
  n=dim(df)[1]
  subset=rep(sample(1:k,k),floor(n/k)) ## k-fold cross validation
  se=0
  for(index in 1:k){
    train=lm_GD_optimizer(formula,df[c(1:n)[subset!=index],], tolerance, maxit, stepsize, verbose)
    ypred=y_pred(formula,train,df[c(1:n)[subset==index],])
    data=data_xy(formula,df[c(1:n)[subset==index],])
    se=se+sum((data$Y-ypred)^2) ## to calculate MSE 
  }
  mse=se/n
  return(print(paste(k,'fold',':MSE is', mse)))
}



