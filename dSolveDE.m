clear; clc; close all;
%% part 7(a), (b)
eqn = 'exp(y) + (t*exp(y) - sin(y)) * Dy = 0';
sol = dsolve(eqn, 't')
solExpr = solve('cos(y) + t*exp(y) == -C11', 'C11');

solFunc = @(t, y) eval(vectorize(solExpr));
[T, Y] = meshgrid(-1: 0.05: 4, 0: 0.03: 3);

figure
contour(T, Y, solFunc(T, Y), 'LineWidth', 2)
xlabel('\bf t')
ylabel('\bf y')
grid on

%% part 7(c), (d)
c = solFunc(2, 1.5);
[T, Y] = meshgrid(-1: 0.05: 4, 0: 0.03: 3);

figure
contour(T, Y, solFunc(T, Y), [c c], 'LineWidth', 2)
xlabel('\bf t')
ylabel('\bf y')
title('IVP with y(2) = 1.5')
grid on

syms y;
a = fzero(@(y) solFunc(1, y) -c, 5);
b = fzero(@(y) solFunc(1.5, y) -c, 5);
c = fzero(@(y) solFunc(3, y) -c, 5);

hold on
plot([1, 1.5, 3], [a, b, c], 'o')

