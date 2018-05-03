// [[Rcpp::depends(BH, bigstatsr)]]
#include <bigstatsr/BMAcc.h>

// [[Rcpp::export]]
NumericVector big_colsums(Environment BM) {
  
  XPtr<FBM> xpBM = BM["address"]; 
  BMAcc<double> macc(xpBM); 
  
  size_t n = macc.nrow();
  size_t m = macc.ncol();
  
  NumericVector res(m);
  
  for (size_t j = 0; j < m; j++) 
    for (size_t i = 0; i < n; i++)
      res[j] += macc(i, j);
  
  return res;
}

/*** R
library(bigstatsr)
tmp <- FBM(10, 10, init = 1:100)
big_colsums(tmp)
*/
