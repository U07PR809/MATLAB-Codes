function [x, y] = rk4(dydx, xSpan, y0, stepSize)
% rk4: fourth-order Runge-Kutta for an ODE
% [x, y] = rk4(dydx, xSpan, y0, h): integrates
% an ODE with fourth-order RK method

% input:
% dydt = name of the M-file that evaluates the ODE
% tspan = [xi, xf]; initial and final times with output
% generated at interval of h, or
% = [x0 x1 ... xf]; specific times where solution output
% y0 = initial value of dependent variable
% h = step size

% output:
% x = vector of independent variable
% y = vector of solution for dependent variable

tInitial = xSpan(1);
tFinal = xSpan(2);
numSegment = ceil((tFinal-tInitial)/stepSize);
x = linspace(tInitial, tFinal, numSegment);
y = y0 * ones(1, numSegment);

% update loop
for iter = 1:numSegment
    % update t
    x(iter+1) = x(iter) + stepSize;
    % update y
    k1 = dydx(x(iter),              y(iter));    
    k2 = dydx(x(iter) + stepSize/2, y(iter) + stepSize/2 * k1);    
    k3 = dydx(x(iter) + stepSize/2, y(iter) + stepSize/2 * k2);    
    k4 = dydx(x(iter) + stepSize  , y(iter) + stepSize * k3);    
    
    y(iter+1) = y(iter) + stepSize/6 * (k1 + 2 * k2 + 2 * k3 + k4);
    
end

end
