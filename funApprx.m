clear; close all; clc

x = linspace(2, 6);
f = @(x) sqrt(x);
l = @(x) 1/4 * x + 1;

figure
plot(x, f(x))
hold on
plot(x, l(x), '-.')

xlabel('x')
legend('f(x)', 'l(x)')