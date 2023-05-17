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
var w {1..n};			# (normal to the separation hyperplane)
var s {1..m};			# slacks
var gamma;				# intercept (location with respect to the origin)

## Objective function
minimize primal_SVM:
	(1/2) * sum {i in 1..n} w[i]^2 + nu * sum {i in 1..m} s[i];

subject to c1 {i in 1..m}:
	-y_train[i]*(sum {j in 1..n}(A_train[i,j]*w[j]) + gamma) - s[i] + 1 <= 0;

subject to c2 {i in 1..m}:
	-s[i] <= 0;
