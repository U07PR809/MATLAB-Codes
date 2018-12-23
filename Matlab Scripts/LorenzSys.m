function [t, x] = LorenzSys(initCond)
% Solution of the Lorenz equations:
%     dx/dt = -10x + 10y
%     dy/dt =  25x - y - xz
%     dz/dt = -8/3z + xy 

% time: is the runtime provided by the user
% acc: is the accuracy level provided by the user
% initCond: a vector of the initial conditions for x, y, z (i.e.
% x(1), x(2), and x(3))
% tspan: time interval
% options: uses acc to set the accuracy level for ode45

acc = 1e-6;
time = 60;

fprintf(['The initial values for x, y, z are %4.2f, % 4.2f, and %4.2f',... 
         ' respectively.\n'], initCond(1), initCond(2), initCond(3));

tspan = [0 time];

% options is used to set the tolerance based on acc used with ode45
options = odeset('RelTol', acc);

% Call ode45 to solve equations
[t, x] = ode45(@Lorenz, tspan, initCond, options);

% Plot results
% Figure 1 shows the plots x, y, z (or the vector x) vs. time
figure; plot(t, x);
xlabel('time'); ylabel('x vector');
grid; legend('x(t)', 'y(t)', 'z(t)');
title('Graphs of x, y, z vs. time');
axis square

% Figure 2 shows the plot of the solution in 3D
figure; plot3(x(:, 1), x(:, 2), x(:, 3));
grid; title('Plot of the solution in xyz-space');
axis square

end