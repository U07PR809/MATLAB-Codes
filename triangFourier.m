clear; close all; clc;
% creates time row vector from -pi to pi in 300 evenly spaced points
x = linspace(-pi, pi, 300);
% preallocate values to value vector of approximate function f 
f = zeros(1, numel(x));

% loops over the odd integers for 8 terms
for m = 0: 2
    f = f + 4/pi*1/(2*m +1)^2 * cos((2*m +1)* x);
end
% adds the first term a0/2 = -7 to f
f = f + pi/2;

% plot f vs t
figure
plot(x, f)
xlabel('x')
ylabel('f(x)')
grid on
axis tight
