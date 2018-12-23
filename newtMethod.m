function [x, numIter] = newtMethod(func, dfunc, x0, tol)
% uses the Newton-Raphson method to find the roots of
% a nonlinear equation
% [x, numIter] = newtmult(func, x0, tol):

% input:
% func  = name of function that returns f and J
% x0    = initial guess
% es    = desired percent relative error
% maxit = maximum allowable iterations )

% output:
% x      = vector of roots
% f      = vector of functions evaluated at roots
% relErr = relative error
% iter   = number of iterations

numIter = 0;
x = x0;

while (1)
    
    xOld = x;
    x = x - func(x)/dfunc(x);
    disp(x)
    numIter = numIter + 1;
    relErr = max( abs((x - xOld)/x) );
%     disp(relErr)
    
    if relErr<= tol, break, end
    
end
end