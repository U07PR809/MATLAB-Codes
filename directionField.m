clear; close all; clc;
%% part (a)
% meshgrid creates a grid of points in the xy-plane
[x, y] = meshgrid(-4:0.2:4, -4:0.2:4);
% computes the matrix of slopes of the vectors attached
% to each grid point
dy = x.*y;
dx = ones(size(dy));
% normalization factor used to scale vectors to have 
% unit length
L = sqrt(1 + dy.^2);

figure
% quiver plots vectors at each grid point
quiver(x, y, dx./L, dy./L, 0.5);
xlabel('x');
ylabel('y');
title('Direction field for dy/dx = x.y');
axis square
axis tight

%% part (b)
% meshgrid creates a grid of points in the xy-plane
[x, y] = meshgrid(-4:0.2:4, -4:0.2:4);
% computes the matrix of slopes of the vectors attached
% to each grid point
dy = 2*y.*(3-y);
dx = ones(size(dy));
% normalization factor used to scale vectors to have 
% unit length
L = sqrt(1 + dy.^2);

figure
% quiver plots vectors at each grid point
quiver(x, y, dx./L, dy./L, 0.5);
xlabel('x');
ylabel('y');
title('Direction field for dy/dx = 2y.(3-y)');
axis square
axis tight
