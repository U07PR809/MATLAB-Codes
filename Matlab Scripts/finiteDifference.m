clear all; close all; clc
e = 0.57;
P = 2.1e3;
E = 200e9;
L = 6;
h = 0.05;
d0 = 0.03;
I0 = pi*d0^4/64;
c0 = E*I0/P;
c1 = -e/L*h^2;


x = (0:h:L)';
n = length(x) -1;

e1 = c0 * (1 + x(2: n)/L).^4;
e0 = h^2 - 2 * e1;
e2 = e1;

A = 1/100 * spdiags([e2, e0, e1], [-1, 0, 1], n-1, n-1);

figure
spy(A)
title('Sparse Pattern of Matrix A')

fprintf('The condition number of matrix A is %0.3e \n', condest(A))
fprintf('The determinant of matrix A is %0.3e \n', det(A))

b = c1 * x(2:n);
solution = A\b;
y = [0; solution; 0];
fprintf('The maximum deflection is %0.2f cm \n', max(y))

figure
plot(x, y)
xlabel('x (m)')
ylabel('y (cm)')
title('Buckling under Load P = 2.1 kN')
grid on
grid minor
