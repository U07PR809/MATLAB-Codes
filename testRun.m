clear; clc; close all;
numInterval = 100;
tSpan = [0 2*pi];
y0 = 0;

[t, y] = modifierEuler(@(t, y) cos(t), tSpan, y0, numInterval);

figure
plot(t, y, '-o')
xlabel('\bf t')
ylabel('\bf y')
grid on