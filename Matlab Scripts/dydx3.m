function rhs = dydx3(x, y)
% governing ODE dydx = rhs
% dydx = dydx(x, y)

% input:
% x = independent variable
% y = dependent variable

% output:
% dydx = rhs of the ODE

% rhs = y;
% rhs = 1/x;
rhs = 4/(1 + x^2);
end