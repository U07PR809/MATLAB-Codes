clear all; close all; clc
x = [0.1, 0.2, 0.4, 0.6, 0.9, 1.3, 1.5, 1.7, 1.8]';
z = [0.75, 1.25, 1.45, 1.25, 0.85, 0.55, 0.35, 0.28, 0.18]';

X = [x, ones(length(x), 1)];
b = X\z;
zCalc1 = X*b;

zCalc2 = -2.4733 * x + log(9.6618);

beta  = b(1);
gamma = b(2);
alpha = exp(gamma);

figure
scatter(x, z)
hold on
plot(x, zCalc1)
plot(x, zCalc2, 'o-')
axis square
xlabel('x')
ylabel('z')
title('Linear Regression Model')
legend('Data', 'Linear Fit', 'Answer');