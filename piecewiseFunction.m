clear; close all; clc;

f = @(x) (-4 * x).* (x <= -4)  + (-2*x + 8).*((-4 < x) & (x <= 0)) + ...
            (2*x + 8).*((0 < x) & (x <= 4)) + (4*x).*(x > 4) ;
x = linspace(-10, 10, 1000);

figure
plot(x, f(x))

hold on
plot([-4, 4], [16, 16], 'ro')
hold off

xlabel('\bfx')
ylabel('\bff(x)')
grid on
grid minor
axis square