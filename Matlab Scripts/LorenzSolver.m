clear all; close all; clc
[t1, posVec1] = LorenzSys([-1; -1; -1]);
[t2, posVec2] = LorenzSys([-1.01; -1; -1]);

figure
subplot(3, 1, 1)
plot(t1, posVec1(:, 1), 'b')
xlabel('t')
ylabel('x(t)')
title('initial condition [-1, -1, -1]')

subplot(3, 1, 2)
plot(t2, posVec2(:, 1), 'r')
xlabel('t')
ylabel('x(t)')
title('initial condition [-1.01, -1, -1]')

subplot(3, 1, 3)
plot(t1, posVec1(:, 1))
hold on
plot(t2, posVec2(:, 1))
xlabel('t')
ylabel('x(t)')
title('comparison of x(t) for both initial conditions')
legend('[-1;-1;-1]', '[-1.01;-1;-1]')

hold off