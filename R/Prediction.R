#' Title
#'
#' @param opt_obj output of either the function lm_GD_optimizer or lm_SD_optimizer
#' @param formula a formula specyfing the model
#' @param df dataframe
#'
#' @return
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