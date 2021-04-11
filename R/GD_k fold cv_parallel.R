#' Parallel method to k-fold crossing validation
#' 
#' cvparallel is used to parallelize the k-fold cross validation
#' 
#' @param k [numeric] number of fold to create
#' @param formula [character] a symbolic description of the model to be fitted 
#' (as lm), with -1 if the intercept is not included
#' @param df [numeric] dataset containing the variables of interest
#' @param tolerance [numeric] tolerance level, stopping criteria of the 
#' algorithm (error<tolerance: stop)
#' @param maxit [numeric] maximum number of iterations, used if the stopping 
#' criteria is never matched
#' @param stepsize [numeric] learning parameter, to update the parameters at 
#' each iteration 
#' @param verbose [logical] indicating if the function write messages during 
#' the computation
#' @param cores the number of cores to be used in the parallelization
#'
#' @export
#' @returns [numeric] a vector of sample mean square errors calculated
#' @import dplyr
#' @import tidyr
#' @import tibble
#' @import stringr
#' @import doSNOW
#' @import funprog
#' @import parallel
#' 

###### using parallel method 

#### divide the data into k parts
### where k means k-fold cross validation

cvparallel<-function(k,formula, df, tolerance, maxit, stepsize, verbose, cores){
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
  
  cluster <- parallel::makeCluster(cores, type = "SOCK")
  registerDoSNOW(cluster)
  
  MSE=snow::parLapply(cl = cluster,
                      x = 1:k,
                      fun = loop)

  mse=Reduce(`+`, MSE)/n #### k,'fold',':MSE is', mse
  
  return(mse)
  stopCluster(cluster)
  
}

