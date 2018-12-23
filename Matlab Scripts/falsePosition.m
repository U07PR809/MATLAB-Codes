function [root, fx, iter]= falsePosition(func, xl, xu, es, maxIter)
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

iter = 0;
while(1)
    
    xr = xu - func(xu) * (xl - xu) /(func(xl) - func(xu)) ;
    iter = iter + 1;
    if abs((xr - xu) / xu) < es
        root = xr;
        fx = func(root);
        break
    end
    test = func(xl)*func(xr);
    if test < 0
        xu = xr;
    else 
        xl = xr;
    end
    if iter >= maxIter
        fprintf('Solution was not cbtained in %i iterations. \n' ,iter)
        break
    end
end
% root = xr; 
% fx = func(xr);
% if iter == maxIter
%     fprintf('Solution was not obtained in %i iterations. \n' , maxIter)
%     root = fprintf('No answer') ;
end