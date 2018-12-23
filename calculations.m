clear; clc;

x = -10.^(-4:-1);
y = 3 * x.^2 .* sin(1./x) - x .* cos(1./x);