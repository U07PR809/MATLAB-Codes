function bisect( )
% bisect():
% uses bisection method to find the root of function

% func = name of function
% xLower, xUpper = lower and upper guesses

% root = real root
% es = tolerance
% ea = approximate relative error (%)
% numIter = number of iterations

clear; clc;

es = 1e-6;         

Q = 200;
k = 0.015;
a = 2.5e-5;
t = 120;

func = @(x) Q/k*x * (exp(-x.^2/(4*a*t))/sqrt(pi)*sqrt(4*a*t)/x - ...
            erfc(x/sqrt(4*a*t))) - 30;

xLower = 0.001;   
xUpper = 1;       

xRoot = xLower;
numIter = 0;
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

fprintf('The root x is %0.6f. \n', root)
fprintf('The number of iterations are %d. \n', numIter)

end