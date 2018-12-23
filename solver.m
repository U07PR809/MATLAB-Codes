close all; clear; clc
%% Time Interval & Initial Condition

% initial time
tStart = 0;
% time step-size
tStep = 1e-1;
% final time
tEnd = 10;

% initial condition
% Here, z(1) = x, z(2) = u, z(3) = y , z(4) = v
z0 = [0 50 0 0];

%% ode45

[t, z] = ode45(@func, [tStart, tEnd], z0);

%% Plots

figure
plot(t, z(:, 1), '--', t, z(:, 3), ':')
xlabel('t')
% ylabel('x(t)')
legend('x', 'y')

figure
plot(t, z(:, 2), '--', t, z(:, 4), ':')
xlabel('t')
% ylabel('z(t)')
legend('u', 'v')

%% Display Results

x = z(:, 1);
y = z(:, 3);
u = z(:, 2);
v = z(:, 4);

tDesired = tStart : 0.1 : tEnd;
xDesired = interp1(t, x, tDesired); 
yDesired = interp1(t, y, tDesired); 
uDesired = interp1(t, u, tDesired); 
vDesired = interp1(t, v, tDesired); 

fprintf('     t          x          y          u       v\n')
datasave=[];
count = 0;
i = 1;
while count < 2
    datasave = [datasave; tDesired(i) xDesired(i) yDesired(i) uDesired(i) vDesired(i)];
    i = i + 1;
    if yDesired(i) > 300
        count = count + 1;
    end
end
disp(datasave)

yGround = 300;
tGround = interp1(y, t, yGround);
xGround = interp1(y, x, yGround);
uGround = interp1(y, u, yGround);
vGround = interp1(y, v, yGround);
fprintf('When the package hits the ground, t = %0.1f, x = %0.2f, y = %0.2f, u = %0.2f, v = %0.2f\n', tGround, xGround, yGround, uGround, vGround)

%% ODE rhs function

function zDot = func(t, z)
% Evaluate the system of ODEs
%
% Here
% z(1) = x, z(2) = u, z(3) = y , z(4) = v

% constants
A = 1;
g = 9.81;
M = 2000/g;
V_w = 20;
C_d = 0.8;
rho = 1.225;

% rhs functions of system of ODEs
zDot(1) = z(2);

V_inf = sqrt((z(2)+V_w)^2 + z(4)^2);
cosTheta = ( z(2) + V_w )/V_inf;
zDot(2) = -( C_d * rho * (V_inf)^2 * A )/ (2 * M) * cosTheta;

zDot(3) = z(4);

sinTheta = z(4)/V_inf;
zDot(4) = g - ( C_d * rho * (V_inf)^2 * A )/ (2 * M) * sinTheta;

zDot = [zDot(1); zDot(2); zDot(3); zDot(4)];
end