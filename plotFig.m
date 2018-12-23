clear; close all; clc;
t = linspace(0, 125, 500);
x = 15/4 * t .* sin(2/5 * t);

figure
plot(t, x)
xlabel('t')
ylabel('x(t)')
grid on
grid minor

hline = refline([0 0]);
hline.Color = 'r';