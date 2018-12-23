function [x, y] = newMethod (funcDerivatives, xSpan, initCond, stepSize)
% [x, y] = newMethod(funcDerivatives, xSpan, initCond, stepSize):
% uses Euler's method to integrate an ODE

% input:
% funcDerivatives = name of the function M−file that evaluates the
%                   derivatives of the rhs function of the ode
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
    derivatives = funcDerivatives(x(i), y(i));
    y(i + 1) = y(i) + derivatives(1) * stepSize + ( derivatives(2) + ...
               derivatives(3) * derivatives(1) )* (stepSize)^2 / 2;
end
end