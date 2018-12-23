function LorenzSys()
% Solution of the Lorenz equations:
%     dx/dt = s(y-x)
%     dy/dt = rx - y - xz
%     dz/dt = xy - bz
% r: is a global variable that will hold the user input for the
% parameter r
% time: is the runtime (number of time steps) provided by the user
% acc: is the accuracy level provided by the user
% initx: a vector of the initial conditions for x, y, z (i.e.
% x(1), x(2), and x(3))
% tspan: time interval
% options: uses acc to set the accuracy level for dode45

global s r b
disp('***************************************');
disp('* Welcome to the Lorenz System Solver *');
disp('***************************************');
disp('*        dx/dt = s(y-x)               *');
disp('*        dy/dt = rx - y - xz          *');
disp('*        dz/dt = xy - bz              *');
disp('***************************************');
s = input('Enter a value for the parameter s: ');
r = input('Enter a value for the parameter r: ');
b = input('Enter a value for the parameter b: ');
time = input('Enter a value for the runtime: ');
acc = input('Enter a accuracy value: ');

% initx is the vector containing the initial condition
% you will change the initial condition as instructed
initCond = [-1, -1, 1]';
fprintf(['The initial values for x, y, z are %4.2f, % 4.2f, and %4.2f',... 
         'respectively.\n'], initCond(1), initCond(2), initCond(3));
fprintf(['The values for the parameters s, r, b are %4.2f, %4.2f,',... 
         'and %4.2f, respectively.\n'], s, r, b);
    
tspan = [0 time];

% options is used to set the tolerance based on acc used with ode45
options = odeset('RelTol', acc);

% Call ode45 to solve equations
[t, x] = ode45(@Lorenz, tspan, initCond, options);

% Plot results
% Figure 1 shows the plots x, y, z (or the vector x) vs. time
figure(1); plot(t, x);
xlabel('time'); ylabel('x vector');
grid; legend('x(t)', 'y(t)', 'z(t)');
title('Graphs of x, y, z vs. time');
axis square

% Figure 2 shows the plot of the solution in the xz-plane 
figure(2); plot(x(:, 1), x(:, 3));
xlabel('x'); ylabel('z');
grid; title('Plot of z vs. x');
axis square

% Figure 3 shows the plot of the solution in 3D
figure(3); plot3(x(:, 1), x(:, 2), x(:, 3));
grid; title('Plot of the solution in xyz-space');
axis square

end