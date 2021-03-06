% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{betahat_GD_Cpp}
\alias{betahat_GD_Cpp}
\title{betahat_GD_Cpp}
\arguments{
\item{beta}{[numeric] vector containing an initial guess for the beta vector}

\item{X}{[numeric] design matrix}

\item{Y}{[numeric] response variable vector}

\item{tolerance}{[numeric] tolerance level, stopping criteria of the algorithm 
(error<tolerance: stop)}

\item{maxit}{[numeric] maximum number of iterations, used if the stopping 
criteria is never matched}

\item{stepsize}{[numeric] learning parameter, to update the parameters at 
each iteration}
}
\description{
Estimation Linear Regression model via Gradient Descend method
Output: [list] Beta paraameters estimated
}
