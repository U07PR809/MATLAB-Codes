clear; close all; clc;
%% part (a)
% creates time row vector from -2*pi to 2*pi in 300 evenly spaced points
t = linspace(0, 2*pi, 500);
% preallocate values to value vector of approximate function f 
fa = zeros(1, numel(t));

% loops over the odd integers for 5 terms
for m = 0:3
    fa = fa + 2/pi * sin((2*m + 1) * t) / (2*m + 1);
end

% plot f vs t
figure
plot(t, fa)
xlabel('t')
ylabel('f(t)')
grid on
grid minor
axis tight

%% part (b)
% creates time row vector from -2*pi to 2*pi in 300 evenly spaced points
t = linspace(0, 2*pi, 500);
% preallocate values to value vector of approximate function f 
fb = zeros(1, numel(t));

% loops over the odd integers for 5 terms
for m = 0:4
    fb = fb + 2/pi * sin((2*m + 1) * t) / (2*m + 1);
end

% plot f vs t
figure
plot(t, fb)
xlabel('t')
ylabel('f(t)')
grid on
grid minor
axis tight

%% part (c)
% creates time row vector from -2*pi to 2*pi in 300 evenly spaced points
tc = linspace(-2*pi, 2*pi, 500);
% preallocate values to value vector of approximate function f 
fc = zeros(1, numel(tc));

% loops over the odd integers for 5 terms
for m = 0:4
    fc = fc + 2/pi * sin((2*m + 1) * tc) / (2*m + 1);
end

% plot f vs t
figure
plot(tc, fc)
xlabel('t')
ylabel('f(t)')
grid on
grid minor
axis tight

% plot all fs 
figure
plot(t, fa, t, fb)
hold on
plot(tc, fc)
xlabel('t')
ylabel('f(t)')
legend('part(a)', 'part(b)', 'part(c)')
grid on
grid minor
axis tight
