#!/bin/bash
for i in {0..10}
  do 
    # Rscript --vanilla permutation-tests-wits.Rmd $i
    Rscript --vanilla permutation-tests-wits-residuals.Rmd $i
 done