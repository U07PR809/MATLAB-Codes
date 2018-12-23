function [t,y] = midOde (dydt, tSpan, y0, stepSize)
% eulode: Euler ODE solver
% [t,y] = eulode (dydt,tspan,y0,h):
% uses Euler's method to integrate an ODE

% input:
% dydt = name of the M−file that evaluates the ODE
% tspan = [ti, tf] where ti and tf = initial and
% final values of independent variable
% y0 = initial value of dependent variable
% h = step size

% output:
% t = vector of independent variable
% y = vector of solution for dependent variable

tInitial = tSpan(1);
tFinal   = tSpan(2);
t = (tInitial: stepSize :tFinal)';

y(1, :) = y0;
yp(1, :) = y(1, :);

for i = 1: length(t)-1   
    k1 = dydt( t(i), y(i,:) )';
    ymid = y(i, :) + k1 * stepSize/2;
    k2 = dydt(t(i) + stepSize/2, ymid)';
    y(i + 1, :) = y(i, :) + k2 * stepSize;
    yp(i, :) = y(i, :);
end
end
