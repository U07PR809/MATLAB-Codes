close all; clear; clc
%% Range of the Projectile for a given value of k
% initial time
tStart = 0;
% time step-size
tStep = 1e-2;
% final time
tEnd = tStart + tStep;

% initial conditions
v0 = 360;
alpha = 40 * pi/180;

z0 = [0 v0 * sin(alpha) 0 v0 * cos(alpha)];

k = 60e-6; % change the value of k 

while 1
   [t, z] = ode45(@(t, z) stateFunc(t, z, k), [tStart, tEnd], z0);
   yVec = z(:, 1);

   if yVec(end) < 0
       break;
   end
   tEnd = tEnd + tStep;
end

xVec = z(:, 3);
fprintf('The range of the projectile for k = %0.6f is %0.2f m.\n', k, xVec(end))

%%
% initial time
tStart = 0;
% final time
tEnd = t(end);

tSpan = [tStart tEnd];

% [t, z] = ode45(@(t, z) stateFunc(t, z, k), tSpan, z0);
sol = ode45(@(t, z) stateFunc(t, z, k), tSpan, z0);
x = linspace(tStart, 5, tEnd);
y = deval(sol, x);
disp(x);
disp(y(3, :))
% figure
% plot(t, z(:, 1))
% 
% figure
% plot(t, z(:, 3))



% fprintf('%0.2f, %0.2f\n', z(:, 1), z(:, 3))
% fprintf('%0.2f\n', z(:, 1))

% fprintf('xCoordinate yCoordinate\n')
% fprintf('%0.2f %0.2f\n',  z(:, 3), z(:, 1))

% fprintf('The velocity at time t = 5 is %0.2f \n', z(end))