function [t, y] = modifierEuler (ODEFUN, TSPAN, Y0, N)

% modifierEuler: Modified Euler ODE solver (Heun's Method)
% uses Euler's modified method to integrate an ODE

% input:
% ODEFUN  =  a function representing the equation for y'( a function of t and y)
% TSPAN   =  a vector containing the start time and end time (TSPAN = [tStart, tEnd])            
% Y0      =  the value for y at tStart
% N       =  the number of steps

% output:
% t  = the output time vector 
% y  = the output y vector

tStart = TSPAN(1);
tEnd   = TSPAN(2);
stepSize = (tEnd - tStart)/N;
t = tStart: stepSize :tEnd;

y = Y0 * ones(1, length(t));

for i = 1: length(t)-1   
    y(i + 1) = y(i) + ODEFUN(t(i), y(i)) * stepSize;
    y(i + 1) = y(i) + 1/2 * ( ODEFUN(t(i), y(i)) + ODEFUN(t(i + 1), y(i + 1)) ) * stepSize;
end
end