## Create a new package with RStudio

# Package setup -----------------------------------------------------------

# Use version control
#install.packages("usethis")
# usethis::use_git_config(
#   scope = "project",
#   user.name = "Francesco Barile",
#   user.email = "f.barile2@campus.unimib.it"
# )
# usethis::use_git()

# avoid problem with the dev scripts: dev/package-utility.R (this file)
dir.create("dev")
# save this file in `dev` as `setup.R`
usethis::use_build_ignore("dev")
# now you can save or move this file in "dev"

# Fill in the DESCRIPTION file
# rstudioapi::navigateToFile( "DESCRIPTION" )
# usethis::use_description(
#   list(
#     Title = "CLRM Package",
#     `Authors@R` = "person('Francesco', 'Barile', email = 'f.barile2@campus.unimib.it', role = c('cre', 'aut'))",
#     Description = "This package provides user-friendly functions to estimate a Classical Linear Regression Model",
#     URL = "https://github.com/FrancescoBarile/Hope"
#   )
# )
usethis::use_lgpl_license()       # You can set another license here
usethis::use_tidy_description()   # sort fields and packages

## Common tasks
usethis::use_readme_md( open = FALSE )
# usethis::use_code_of_conduct()
# usethis::use_lifecycle_badge( "Experimental" )
# usethis::use_news_md( open = FALSE )


## Use tests: if you want to use tests
# usethis::use_testthat()
# installed.packages("devtools")


# Develop -----------------------------------------------------------------


## Add a package
usethis::use_package( "dplyr" )
usethis::use_package( "stringr" )
usethis::use_package( "tibble" )
usethis::use_package( "tictoc" )
usethis::use_package( "RcppArmadillo" )
usethis::use_package( "tidyr")
# remeber to add it to ROXYGEN or NAMESPACE:
#' @import dplyr  # ROXYGEN
#' import(dplyr)  # NAMESPACE

## If you want to use roxygen, enable ROXYGEN in the project.
# Menu: tools > Project options > build tools > generate the documentation with roxygen
usethis::use_namespace(roxygen = TRUE)
devtools::document() # to fill NAMESPACE and documentation with ROXYGEN comments
# or roxygen2::roxygenise() # converts roxygen comments to .Rd files.
# or [Ctrl + Shift + D] in RStudio

## Build or load
# Load the package [CTRL + SHIFT + L] or install-and-reload [CTRL + SHIFT + B]

## Check the package for Cran or [CTRL + SHIFT + E]
devtools::check(document = FALSE) # check the package

## Add internal datasets
## If you want to provide data along with your package
usethis::use_data_raw( name = "mydataset", open = FALSE )
usethis::use_data_raw( name = "mydataset_noconst", open = FALSE )
# usethis::use_data_raw( name = "mydata", open = FALSE )
# usethis::use_data()

## Tests
## Add one line by test you want to create
usethis::use_test( "data_xy" )
usethis::use_test( "lm_specification" )
usethis::use_test( "GradientDescend_R" )
usethis::use_test( "SteepestDescend_R" )
usethis::use_test( "lm_GD_optimizer" )
usethis::use_test( "lm_SD_optimizer" )
usethis::use_test( "betahat_GD_Cpp" )
usethis::use_test( "betahat_SD_Cpp" )


## Vignette
usethis::use_vignette("GradientDescend_R")
usethis::use_vignette("GradientDescend_Cpp")
usethis::use_vignette("StepeestDescend_Cpp")
usethis::use_vignette("GD_general_function")
usethis::use_vignette("StepeestDescend_R_vs_Cpp")

devtools::build_vignettes()

# Install the package and see it with `vignette("ThisTidyPackage")`
# List your vignettes: vignette(package = 'cancRFDS')
# Install your package manually: devtools::install(build_vignettes = TRUE)

# Deploy ------------------------------------------------------------------

# devtools::missing_s3()
#
# devtools::check()
# rhub::check_for_cran()

