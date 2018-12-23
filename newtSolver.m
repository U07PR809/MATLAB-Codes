clear; clc;

func  = @(x) x^(1/3);
dfunc = @(x) 1/(3 * x^(2/3));
x0 = 2;
tol = 1e-3;

[x, numIter] = newtMethod(func, dfunc, x0, tol);