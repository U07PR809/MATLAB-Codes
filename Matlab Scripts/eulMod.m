function [x, y] = eulMod (dydx, xSpan, boundCond, numInterval)
% eulMod: Modified Euler ODE solver (Heun's Method)
% [x, y] = eulMod (dydx, xSpan, boundCond, numInterval)
% uses Euler's modified method to integrate an ODE
% input:
% dydx = name of the function M−file that evaluates the ODE
% xSpan = [xi, xf] where xi and xf = initial and
% final values of the independent variable x
% boundCond = boundary value of dependent variables
% numInterval = number of sub-intervals
% output:
% x = vector of independent variable
% y = vector of solution for dependent variable

xInitial = xSpan(1);
xFinal   = xSpan(2);
stepSize = (xFinal - xInitial)/numInterval;
x = xInitial: stepSize :xFinal;

y = boundCond * ones(1, length(x));

for i = 1: length(x)-1   
    y(i + 1) = y(i) + dydx(x(i), y(i)) * stepSize;
    y(i + 1) = y(i) + 1/2 * ( dydx(x(i), y(i)) + dydx(x(i + 1), y(i + 1)) )  * stepSize;
end
end
