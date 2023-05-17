##############################################################
##					Mathematical Optimization				## 
## 					J.P Zaldivar & E. Millán				##
##############################################################

## Parameters
param n >= 1, integer;	# number of rows
param m >= 1, integer;  # number of columns
param nu;               # tradeoff

param y_train {1..m};
param A_train {1..m,1..n};

param y_test {1..m};
param A_test {1..m,1..n};

## Variables
var la {1..m} >= 0, <= nu;

## Objective function
minimize dual_SVM:
	1/2 * (sum {i in 1..m, j in 1..m} la[i] * y_train[i] * la[j] * y_train[j] * sum{k in 1..n} A_train[i,k] * A_train[j,k]) - (sum {i in 1..m} la[i]); 

subject to c1:
	sum {i in 1..m} la[i] * y_train[i] = 0;
