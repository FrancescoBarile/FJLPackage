#' Title cvsequencial
#' 
#' ## using sequential method to calculate the k-fold crossing validation

#' @param k k-fold cross validation
#' @param formula a formula specifying the model
#' @param df dataset containing the variables of interest
#' @import dplyr
#' @import tidyr
#' @import tibble
#' @import stringr
#' @returns 
#' @export
#' 
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

opt_obj=lm_GD_optimizer

data_xy <- function(formula, df) {
  
  model_spec = lm.model_spec(formula, df)
  var_names = model_spec$var_names
  intercept_logical = model_spec$intercept
  y = df %>% select( as.character( var_names %>% filter(type=='Dependent') %>%  
                                     pivot_wider(names_from = type, values_from = var_name) ) )  
  
  x = df %>% select( as.character( var_names %>% filter(type!='Dependent') %>%  
                                     pivot_wider(names_from = type, values_from = var_name) ) ) 
  if(intercept_logical){
    x <- x %>% mutate(Intercept=rep(1, nrow(x))) %>% relocate(Intercept)
  }
  return(list(Y=y, X=x))
}

y_pred <- function(formula,opt_obj,df) {
  method = str_c(str_extract_all(opt_obj$method, "[A-Z]")[[1]][1], 
                 str_extract_all(opt_obj$method, "[A-Z]")[[1]][2])
  beta_hat = opt_obj$beta_hat
  data=data_xy(formula,df)
  X = as.matrix(data$X)
  Y_hat = tibble(y_hat=as.numeric(X%*%beta_hat) )%>%
    rename(!!paste0(names(opt_obj$Y), "_pred_", method, sep="") := y_hat)
  return(Y_hat)
  }

###### using sequential method 
#### calculate the mean square error
SE<-function(y,y_pred){
  se=sum((y-y_pred)^2)
  return(se)
}

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
    se=se+SE(data$Y,ypred) ## to calculate MSE 
  }
  mse=se/n
  return(print(paste(k,'fold',':MSE is', mse)))
}



