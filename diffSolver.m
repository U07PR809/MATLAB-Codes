clear; clc; close all;

tspan = [0 5];
x0 = 0.729011;
sol = ode45( @(t, x) x.^2 - t, tspan, x0);

t = linspace(0, 5, 100);
xp = sqrt(t);

x = deval(sol, t);

figure
plot(t, xp, '.', t, x, '.')
xlabel('\bf t')
ylabel('\bf x')
grid on
grid minor

diffVec = abs(xp - x);
[val, index] = min(diffVec);

fprintf('The value of t is %0.2f \n', t(index))