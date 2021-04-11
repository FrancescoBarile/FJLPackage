#' Dataset in the form needed for estimating Linear Models 
#'
#' @param formula [character] a formula specifying the model
#' @param df [numeric] dataset containing the variables of interest
#'
#' @return [list] matrix of regressors and a vector of the response variable
#' @import dplyr
#' @import tidyr
#' @import tibble
#' 
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