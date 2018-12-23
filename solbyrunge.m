clear; close all; clc;

L = 2; g = 32.17;
F = @(t, Y) [ Y(2) ; -(g/L) * sin( Y(1) )];

t0 = 0; tf = 2; n = 1000; h = (tf - t0)/ n;
alpha = [ pi/6 ; 0 ];
 
[t, w] = midpoint(t0, h, n, alpha, F);
% [t', w'];
plot(t, w(1, :))
grid on

