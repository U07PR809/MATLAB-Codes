clear all; close all; clc
% part 2
numInterval = 10;
xSpan = [1 2];
y1 = 0;
while (1)
   [x, y] = eulMod(@dydx, xSpan, y1, numInterval);
   if abs(y(end) - log(2)) <= 1e-6
       fprintf('The value of y(1) is %0.5f \n', y(end))
       fprintf('The number of subintervals required are %i \n', numInterval)
       break
   end
   numInterval = 2 * numInterval;
end


% % part 1
% numInterval = 10;
% xSpan = [0 1];
% y0 = 1;
% while (1)
%    [x, y] = eulMod(@dydx, xSpan, y0, numInterval);
%    if abs(y(end) - exp(1)) <= 1e-6
%        fprintf('The value of y(1) is %0.5f \n', y(end))
%        fprintf('The number of subintervals required are %i \n', numInterval)
%        break
%    end
%    numInterval = 2 * numInterval;
% end





















% function [x, y] = eulMod (dydx, xSpan, boundCond, numInterval)
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

% xInitial = xSpan(1);
% xFinal   = xSpan(2);
% stepSize = (xFinal - xInitial)/numInterval;
% x = xInitial: stepSize :xFinal;
% 
% y = boundCond * ones(1, length(x));
% 
% for i = 1: length(x)-1   
%     y(i + 1) = y(i) + dydx(x(i), y(i)) * stepSize;
%     y(i + 1) = y(i) + 1/2 * ( dydx(x(i), y(i)) + dydx(x(i + 1), y(i + 1)) )  * stepSize;
% end
% end


% function rhs = dydx(x, y)
% governing ODE dydx = rhs
% dydx = dydx(x, y)

% input:
% x = independent variable
% y = dependent variable

% output:
% dydx = rhs of the ODE

% rhs = y;
% % rhs = 1/x;
% % rhs = 4/(1 + x^2);
% end
% %% part 3
% numInterval = 10;
% xSpan = [0 1];
% y0 = 0;
% while (1)
%    [x, y] = eulMod(@dydx3, xSpan, y0, numInterval);
%    if abs(y(end) - pi) <= 1e-6
%        fprintf('The value of y(1) is %0.5f \n', y(end))
%        fprintf('The number of subintervals required are %i \n', numInterval)
%        break
%    end
%    numInterval = 2 * numInterval;
% end