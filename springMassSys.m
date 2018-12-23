clear; close all; clc;
%% parameters
A = 1;
m = 1;
k = 3;
w = sqrt(k/m);

t = linspace(0, 2*pi);

y = A * sin(w*t);
v = A*w * cos(w*t);

%% part (a)
E = 1/2*m*v.^2 + 1/2*k*y.^2;

figure
plot(t, E)
xlabel('t')
ylabel('E(t)')
xlim([0 2*pi])
title('Energy vs Time')
grid on

% with constant value of E(t) (for a given set of parameters) confirms that
% energy of spring-mass system is constant with time i.e. it  is a conserv-
% ative system.

%% part (c)

figure
plot(y, v)
xlabel('y')
ylabel('v')
title('Phase Plot')
grid on