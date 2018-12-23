function [root, fx, iter]= secant(func, xl, xu, es, maxIter)
% secant: root location zeroes
% [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit):
% uses bisection method to find the root of func
% input:
% func = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.05)
% maxit = maximum allowable iterations (default = 50)

% output:
% root = real root
% fx = function value at root
% iter = number of iterations

% if nargin < 4 || isempty(es), es = 0.05;end
% if nargin < 5 || isempty(maxIter), maxIter = 50;end

for iter = 1: maxIter
    
    xi = xu - func(xu) * (xl - xu) /(func(xl) - func(xu)) ;
    if abs((xi - xu) / xu) < es
        root = xi;
        fx = func(root);
        break
    end
    xl = xu;
    xu = xi;
end
if iter > maxIter
    fprintf('Solution was not obtained in %i iterations. \n' , maxIter)
    root = fprintf('No answer') ;
else
    fprintf('Solution was obtained in %i iterations. \n', iter)
    fprintf('Root = %0.5f', root)
end