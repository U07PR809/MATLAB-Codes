function [t, xp] = rk4sys(dxdt, tspan, x0, h)
% rk4sys: fourth-order Runge-Kutta for a system of ODEs
% [t, x] = rk4sys(dxdt, tspan, x0, h): integrates
% a system of ODEs with fourth-order RK method

% input:
% dydt = name of the M-file that evaluates the ODEs
% tspan = [ti, tf]; initial and final times with output
% generated at interval of h, or
% = [t0 t1 ... tf]; specific times where solution output
% x0 = initial values of dependent variables
% h = step size

% output:
% t = vector of independent variable
% yp = vector of solution for dependent variables

ti = tspan(1);
tf = tspan(2);

t = ti: h: tf;
x(1, :) = x0;
xp(1, :) = x(1, :);

for i = 1: length(t)-1
    k1 = dxdt( t(i), x(i,:) );
    ymid = x(i, :) + k1 * h/2;
    k2 = dxdt( t(i) + h/2, ymid );
    ymid = x(i, :) + k2 * h/2;
    k3 = dxdt( t(i) + h/2, ymid );
    yend = x(i, :) + k3 * h;
    k4 = dxdt( t(i) + h, yend );
    phi = (k1 + 2 * (k2 + k3) + k4)/6;
    x(i + 1, :) = x(i, :) + phi * h;
    xp(i+1, :) = x(i+1, :);    
end
end