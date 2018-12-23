function [x, y] = eulFwd (dydx, xSpan, initCond, stepSize)
% eulode: Euler ODE solver
% [x, y] = eulFwd (dydx, xSpan, initCond, stepSize):
% uses Euler's method to integrate an ODE

% input:
% dydx = name of the function M−file that evaluates the ODE
% xspan = [xi, xf] where xi and xf = initial and final values 
%         of the independent variable x
% initCond = initial value of dependent variables
% stepSize = step size of the independent variable

% output:
% x = column vector of independent variable
% y = column vector of dependent variable (solution)

xInitial = xSpan(1);
xFinal   = xSpan(2);
x = (xInitial: stepSize :xFinal)';

numNodes = length(x);

y = initCond * ones(numNodes, 1);

for i = 1: numNodes-1   
    y(i + 1) = y(i) + dydx(x(i), y(i)) * stepSize;
end
end