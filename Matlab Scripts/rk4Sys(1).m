function [t, yp] = rk4Sys(dydt, tspan, y0, h)
% rk4sys: fourth-order Runge-Kutta for a system of ODEs
% [t, y] = rk4sys(dydt, tspan, y0, h): integrates
% a system of ODEs with fourth-order RK method

% input:
% dydt = name of the M-file that evaluates the ODEs
% tspan = [ti, tf]; initial and final times with output
% generated at interval of h, or
% = [t0 t1 ... tf]; specific times where solution output
% y0 = initial values of dependent variables
% h = step size

% output:
% t = vector of independent variable
% yp = vector of solution for dependent variables

ti = tspan(1);
tf = tspan(2);

t = ti: h: tf;
y(1, :) = y0;
yp(1, :) = y(1, :);

for i = 1: length(t)-1
    k1 = dydt( t(i), y(i,:) );
    ymid = y(i, :) + k1 * h/2;
    k2 = dydt( t(i) + h/2, ymid );
    ymid = y(i, :) + k2 * h/2;
    k3 = dydt( t(i) + h/2, ymid );
    yend = y(i, :) + k3 * h;
    k4 = dydt( t(i) + h, yend );
    phi = (k1 + 2 * (k2 + k3) + k4)/6;
    y(i + 1, :) = y(i, :) + phi * h;
    yp(i+1, :) = y(i+1, :);    
end
end