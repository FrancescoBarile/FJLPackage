#' Title
#' ## using parallel method to calculate the k-fold crossing validation
#' @param k k-fold cross validation
#' @param formula a formula specifying the model
#' @param df dataset containing the variables of interest
#' @param tolerance tolerance level 
#' @param maxit maximun number of iteration
#' @param stepsize learning parameter 
#' @param verbose should the function write messages during the computation?
#'
#' @export
#' @returns 
#' @import dplyr
#' @import tidyr
#' @import tibble
#' @import stringr
#' @import doSNOW
#' @import funprog
#' 

###### using parallel method 

#### divide the data into k parts
### where k means k-fold cross validation

cvparallel<-function(k,formula, df, tolerance, maxit, stepsize, verbose){
  n=dim(df)[1]
  set.seed(2021)
  subset=rep(sample(1:k,k),floor(n/k)) ## k-fold cross validation
  se=0
  
  ### for 
  loop=function(index){
    train=lm_GD_optimizer(formula,df[c(1:n)[subset!=index],], tolerance, maxit, stepsize, verbose)
    ypred=y_pred(formula,train,df[c(1:n)[subset==index],])
    data=data_xy(formula,df[c(1:n)[subset==index],])
    se=sum((data$Y-ypred)^2)
    print(se)
  }
  
  cluster <- makeCluster(2, type = "SOCK")
  registerDoSNOW(cluster)
  
  MSE=snow::parLapply(cl = cluster,
                      x = 1:k,
                      fun = loop)

  mse=Reduce("+", MSE)/n #### k,'fold',':MSE is', mse
  
  return(mse)
  stopCluster(cluster)
  
}

