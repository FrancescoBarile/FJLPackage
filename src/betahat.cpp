#include "RcppArmadillo.h"

using namespace Rcpp;
using namespace arma;

//' Estimation Linear Regression model via Gradient Descend method
//' @title betahat_GD_Cpp
//' @name betahat_GD_Cpp
//' @param beta initial guess beta vector
//' @param X design matrix
//' @param Y response variable vector
//' @param tolerance level
//' @param maxit max num of iter
//' @param stepsize learning parameter
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
//' @title betahat_SD_Cpp
//' @name betahat_SD_Cpp
//' @param beta initial guess beta vector
//' @param X design matrix
//' @param Y response variable vector
//' @param tolerance level
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
