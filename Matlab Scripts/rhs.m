function dydx = rhs(x, y)
% governing ODE dvdt = 1 - v^2
% dvdt = dydt(t, y)

% input:
% x = independent variable
% y = dependent variable

% output:
% dydx = rhs of the ODE

dydx = -y + x^0.1 * (1.1 + x);

end