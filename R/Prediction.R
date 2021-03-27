#' Title
#'
#' @param opt_obj output of either the function lm_GD_optimizer or lm_SD_optimizer
#'
#' @return
#' @export
#' @import dplyr
#' @import stringr

y_pred <- function(opt_obj) {
  method = str_c(str_extract_all(opt_obj$method, "[A-Z]")[[1]][1], 
                 str_extract_all(opt_obj$method, "[A-Z]")[[1]][2])
  beta_hat = opt_obj$beta_hat
  X = as.matrix(opt_obj$X)
  Y_hat = tibble(y_hat=as.numeric(X%*%beta_hat) )%>%
    rename(!!paste0(names(opt_obj$Y), "_pred_", method, sep="") := y_hat)
  return(Y_hat)
}