#include "RcppArmadillo.h"

using namespace Rcpp;
using namespace arma;

//' Estimation Linear Regression model via Gradient Descend method
//' Output: [list] Beta paraameters estimated
//' @title betahat_GD_Cpp
//' @name betahat_GD_Cpp
//' @param beta [numeric] vector containing an initial guess for the beta vector
//' @param X [numeric] design matrix
//' @param Y [numeric] response variable vector
//' @param tolerance [numeric] tolerance level, stopping criteria of the algorithm 
//'(error<tolerance: stop)
//' @param maxit [numeric] maximum number of iterations, used if the stopping 
//'criteria is never matched 
//' @param stepsize [numeric] learning parameter, to update the parameters at 
//'each iteration 
//' @export

// [[Rcpp::export]]

arma::vec betahat_GD_Cpp(arma::vec beta, arma::mat X, arma::vec Y, 
                   double tolerance, int maxit, double stepsize) {
  int t = 1;
  double error = 1;
  
  while( (error>tolerance) & (t<=maxit) ){
    arma::vec gr =  -2*X.t()*Y + 2*X.t()*X*beta;
    arma::vec beta_old = beta;
    beta = beta - stepsize*gr; 
    error = max(abs(beta-beta_old));
    t = t + 1;
  }
  return beta;
}

//' Estimation Linear Regression model via Steepest Descend method
//' Output: [list] Beta paraameters estimated
//' @title betahat_SD_Cpp
//' @name betahat_SD_Cpp
//' @param beta [numeric] vector containing an initial guess for the beta vector
//' @param X [numeric] design matrix
//' @param Y [numeric] response variable vector
//' @param tolerance [numeric] tolerance level, stopping criteria of the algorithm 
//'(error<tolerance: stop)
//' @param maxit [numeric] maximum number of iterations, used if the stopping 
//'criteria is never matched 
//' @export
//' 
// [[Rcpp::export]]

arma::vec betahat_SD_Cpp(arma::vec beta, arma::mat X, arma::vec Y, 
                         double tolerance, int maxit) {
  
  arma::mat H = 2*X.t()*X;
  int t = 1;
  double error = 1;
  
  while( (error>tolerance) & (t<=maxit) ){
    arma::vec gr =  -2*X.t()*Y + 2*X.t()*X*beta;
    arma::vec beta_old = beta;
    double numerator = norm(gr, 2);
    double denominator = as_scalar(gr.t()*H*gr);
    double step = pow(numerator, 2.0)/denominator;
    beta = beta - step*gr; 
    error = max(abs(beta-beta_old));
    t = t + 1;
  }
  return beta;
}
