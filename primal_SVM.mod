## Parameters
param n >= 1, integer;
param m >= 1, integer;

param e {1..m}
param y {1..m};
param A {1..m,1..n};

## Variables
var w;
var gamma;

## Objective function
minimize fobj:
	1/2 * w * w; # si no se puede hacer sumatorio
subject to c:
	Y*(A*w + gamma * e) >= e