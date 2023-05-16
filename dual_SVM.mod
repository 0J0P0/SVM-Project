##############################################################
##					Mathematical Optimization				## 
## 					J.P Zaldivar & E. Millán				##
##############################################################

## Parameters
param n >= 1, integer;	# number of rows
param m >= 1, integer;  # number of columns
param nu;               # tradeoff

param y {1..m};
param A {1..m,1..n};

## Variables
var la {1..m} >= 0, <= nu;

## Objective function
minimize dual_SVM:
	1/2 * (sum {i in 1..m, j in 1..m} la[i] * y[i] * la[j] * y[j] * sum{k in 1..n} A[i,k] * A[j,k]) - (sum {i in 1..m} la[i]); 

subject to c1:
	sum {i in 1..m} la[i] * y[i] = 0;
