clear; close all; clc;
timeSpan = [0, 5];
initCond = [0, 1];
timeStep = 0.01;
[t, x] = rk4sys(@dxdtSys, timeSpan, initCond, timeStep);

figure
plot(t, x(:, 1))
xlabel('t')
ylabel('x(t)')
grid on

