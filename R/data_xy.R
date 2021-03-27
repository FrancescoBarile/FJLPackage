#' Title
#'
#' @param formula a formula specifying the model
#' @param df dataset containing the variables of interest
#'
#' @return
#' @import dplyr
#' @import tidyr
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