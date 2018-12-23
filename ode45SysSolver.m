clear; close all; clc
% initial time
tStart = 0;
% time step-size
tStep = 1e-1;
% final time
% part (a)
tEnd = 9.4;
% part (b), for circular trajectory
% tEnd = 3.1;

% initial conditions
% part(a)
v_y0 = 1.63;
% part (b), for circular trajectory
% v_y0 = 1;

z0 = [ 0.5 0 0 v_y0 ];

[t, z] = ode45(@func, [tStart, tEnd], z0);

figure
plot( z(:, 1), z(:, 3), '-o')
xlabel('x')
ylabel('y')

s = sprintf('Trajectory with v_{y} = %0.2f', v_y0);
title(s)
axis square
grid on
grid minor