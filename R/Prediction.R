#' Function for predicting values
#' 
#' Function that uses the model parameters estimated and predict y starting from x
#' 
#' @param opt_obj [list] output of either the function lm_GD_optimizer or lm_SD_optimizer
#' @param formula [character] a symbolic description of the model to be fitted (as lm), with -1 if the intercept is not included
#' @param df [numeric] dataset containing the variables of interest
#'
#' @return [numeric] vector of the predicted values of the response variable
#' @export
#' @import dplyr
#' @import stringr
#' @import rlang
#' @import tibble
#' 
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