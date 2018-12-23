clear all; close all; clc
tStart = 0;
tEnd = 1.5;
tSpan = [tStart tEnd];

v0 = 25;
h  = 1.4;
theta0 = 20 * pi/180;
y0 = [0 v0*cos(theta0) h v0*sin(theta0)];

[tSpin, ySpin] = ode45(@funWithSpin, tSpan, y0);

% analysis using spline interpolation

xSpin = ySpin(:, 1);
zSpin = ySpin(:, 3);

tQuery = tStart: 1e-2: tEnd;
s = spline(tSpin, zSpin, tQuery);

plot(tSpin, zSpin, 'o', tQuery, s, '-.')
hline = refline(0, 0);
hline.Color = 'r';
xlabel('t')
ylabel('z(t)')
legend('Sample Points', 'spline')

i = 1;
while 1
    if s(i) * s(i+1) <= 0
        break
    end
    i = i + 1;
end
fprintf('The time of flight with Spin is %0.2f s.\n', tQuery(i))
