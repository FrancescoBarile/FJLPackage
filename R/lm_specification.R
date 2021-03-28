#' Title
#'
#' @param formula a formula specifying the model
#' @param df dataset containing the variables of interest
#'
#' @return
#' @import dplyr
#' @import stringr
#' @import tibble
#' @import tidyr
#' 
lm.model_spec<-function(formula, df){
  formula_char = deparse(formula)
  const_logical = !str_detect(formula_char, "- 1")
  y_name = str_trim(str_sub(formula_char, 1, str_locate(formula_char, "~")[1]-1), side="both")
  
  formula_nospace = str_replace_all(formula_char, " ", "")
  formula_reg = str_sub(formula_nospace, str_locate(formula_nospace, "~")[1]+1)
  all_x = formula_reg=="." | (str_detect(formula_char, "\\.") &
    str_sub(formula_reg, str_locate(formula_reg, "\\.")[1]+1, 
            str_locate(formula_reg, "\\.")[1]+1)=="-")
  
  if(all_x){
    x_names = setdiff(names(df), y_name)
  }
  else{
    if(const_logical){
      x_info = str_trim(str_sub(formula_char, str_locate(formula_char, "~")[1]+1), side="both")
    }
    else{
      x_info = str_trim(str_sub(formula_char, str_locate(formula_char, "~")[1]+1, str_locate(formula_char, "-")[1]-1), side="both")
    }
    if( str_detect(x_info, "\\+") ){
      x_names = str_trim(strsplit(x_info, "\\+")[[1]], side="both")
    }
    else{
      x_names = x_info
    }
  }
  
  var_names=
    as_tibble(tibble::rownames_to_column(data.frame(var_name=c(y_name=y_name, x_names=x_names)), var = 'rowname')) %>%
    mutate(type=case_when( str_detect(rowname, "y") ~ "Dependent",
                           TRUE ~ paste("Regressor", row_number()-1 ) )) %>%
    select(type, var_name)
  
  return(list(var_names=var_names, intercept=const_logical))
}