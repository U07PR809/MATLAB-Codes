clear; close all; clc
[x, y] = meshgrid(0: pi/64 :pi/2, 0: pi/64: pi/2);
u = y .* cos(x);
v = -sin(x);

figure
quiver(x, y, u, v)
xlabel('x')
ylabel('y')
title('Vector field <y cos(x), -sin(x)>')
grid on
grid minor
axis square
axis tight
