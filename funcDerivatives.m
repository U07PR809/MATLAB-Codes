function funcDerivatives = funcDerivatives(x, y)
% governing ODE dydx = y
% dydx = func(x, y)

% input:
% x = independent variable
% y = independent variable

% output:
% dydx = rhs of the ODE

funcDerivatives(1) = y; % f
funcDerivatives(2) = 0; % f_x
funcDerivatives(3) = 1; % f_y

end