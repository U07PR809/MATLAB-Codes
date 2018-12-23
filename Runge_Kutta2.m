function [t, yp] = Runge_Kutta2(dydt, tspan, y0, h)
% Runge_Kutta2: second-order Runge-Kutta for a system of ODEs
% [t, y] = Runge_Kutta2(dydt, tspan, y0, h): integrates
% a system of ODEs with second-order RK method

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
    yend = y(i, :) + k1 * h;
    k2 = dydt( t(i) + h, yend );
    phi = (k1 + k2)/2;
    y(i+1, :) = y(i, :) + phi * h;
    yp(i+1, :) = y(i+1, :);
end
end