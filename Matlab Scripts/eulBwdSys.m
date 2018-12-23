function [t, y] = eulBwd (dydt, tSpan, initCond, timeStep)
% eulode: Euler ODE solver
% [t,y] = eulode (dydt, tSpan, initCond, timeStep):
% uses Euler's method to integrate an ODE

% input:
% dydt = name of the function M−file that evaluates the ODE
% tspan = [ti, tf] where ti and tf = initial and
% final values of the independent variable t
% initCond = initial value of dependent variables
% timeStep = step size of the independent variable

% output:
% t = vector of independent variable
% y = vector of solution for dependent variable

tInitial = tSpan(1);
tFinal   = tSpan(2);
t = (tInitial: timeStep :tFinal)';

y(1, :) = initCond;
yp(1, :) = y(1, :);

for i = 1: length(t)-1   
    y(i + 1, :) = y(i, :) + dydt(t(i), y(i, :))' * timeStep;
    y(i + 1, :) = y(i, :) + dydt(t(i+1), y(i+1, :))' * timeStep;
    yp(i + 1, :) = y(i + 1, :);
end
end
