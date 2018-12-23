clear; close all; clc;
xStart = 0;
xEnd = 1;
xSpan = [xStart, xEnd];
initCond = 1;
stepSize = 0.1;

xExact = xStart: stepSize: xEnd;
yExact = exp(xExact);
[xEuler, yEuler] = eulFwd (@dydx, xSpan, initCond, stepSize);
[xMod, yMod] = newMethod (@funcDerivatives, xSpan, initCond, stepSize);

figure
plot(xEuler, yEuler, '-or', xMod, yMod, '-*', xExact, yExact, 'k')
xlabel('\bf x')
ylabel('\bf y')
legend('euler method', 'new method', 'exact')
grid on