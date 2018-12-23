function [x, f, ea, iter] = newtMult(func, x0, es, maxit)
% newtMult: Newton-Raphson root zeroes nonlinear systems
% [x, f, ea, iter] = newtmult(func, x0, es, maxit):
% uses the Newton-Raphson method to find the roots of
% a system of nonlinear equations

% input:
% func  = name of function that returns f and J
% x0    = initial guess
% es    = desired percent relative error 
% maxit = maximum allowable iterations )

% output:
% x    = vector of roots
% f    = vector of functions evaluated at roots
% ea   = approximate percent relative error (%)
% iter = number of iterations

iter = 0;
x = x0;

while (1)
[J, f] = func(x);
dx = J\f;
x = x - dx;
iter = iter + 1;
ea = 100 * max( abs(dx./x) );

if iter >= maxit || ea<= es, break, end
end
end