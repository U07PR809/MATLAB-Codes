clear; close all; clc
timeSpan = [0, 0.5];
x0 = 100;
y0 = 50;
initCond = [x0, y0];
timeStep = 0.1;
[t, v] = rk4sys(@dvdtSys, timeSpan, initCond, timeStep);
x = v(:, 1);
y = v(:, 2);

sprintf('x(%0.1f) = %0.3f, y(%0.1f) = %0.3f', timeSpan(end), x(end), timeSpan(end), y(end))
figure
plot(t, v(:, 1))
xlabel('\bf t')
ylabel('\bf x(t)')
grid on

figure
plot(t, v(:, 2))
xlabel('\bf t')
ylabel('\bf y(t)')
grid on

function dvdt = dvdtSys(t, v)
% dvdt = dvdtSys(t, v):system of first order differential   
% equations governing the volume of water in each tank

% input:
% t = vector of independent variable
% v = vector of solution for dependent variables

% output:
% dvdt = vector of rhs of the system of the first order ODEs

    dv1dt = 0.02 * v(1) - 0.01 * v(1) * v(2);        
    dv2dt = 0.002 * v(1) * v(2) - 0.1* v(2);    
        
    dvdt = [dv1dt dv2dt];
end
