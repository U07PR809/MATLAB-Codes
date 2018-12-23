function [root, fx, numIter] = bisect(func, xLower, xUpper, tol)
% bisect: root location zeroes
% [root,fx, ea, numIter] = bisect(func, xLower, xUpper, es):
% uses bisection method to find the root of func

% input:
% func = name of function
% xLower, xUpper = lower and upper guesses
% es = desired relative error (default = 5 %)

% output:
% root = real root
% fx = function value at root
% ea = approximate relative error (%)
% numIter = number of iterations

numIter = 0;
xRoot = xLower;
ea = 100;

while (1)
    xrold = xRoot;
    xRoot = (xLower + xUpper)/2;
    numIter = numIter + 1;
    
    if xRoot ~= 0
        ea = abs((xRoot - xrold)/xRoot) * 100;
    end
    
    test = func(xLower) * func(xRoot);
    if test < 0
        xUpper = xRoot;
    elseif test > 0
        xLower = xRoot;
    else
        ea = 0;
    end
    
    if ea <= es
        break
    end   
    
end
root = xRoot; 
fx = func(xRoot);

end
