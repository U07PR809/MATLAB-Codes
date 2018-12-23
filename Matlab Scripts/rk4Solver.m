clear all; close all; clc
timeSpan = [0, 3 * 60];
initCond = [24, 30, 10];
timeStep = 0.01;
[t, v] = rk4sys(@dvdtSys, timeSpan, initCond, timeStep);

figure
plot(t, v(:, 1))
xlabel('time (min)')
ylabel('v_{1} (ft^{3})')
title('Volume of water in tank 1')
grid on

figure
plot(t, v(:, 2))
xlabel('time (min)')
ylabel('v_{2} (ft^{3})')
title('Volume of water in tank 2')
grid on

figure
plot(t, v(:, 3))
xlabel('time (min)')
ylabel('v_{3} (ft^{3})')
title('Volume of water in tank 3')
grid on