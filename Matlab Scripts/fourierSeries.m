% creates time row vector from -pi to pi in 300 evenly spaced points
t = linspace(-pi, pi, 300);
% preallocate values to value vector of approximate function f 
f = zeros(1, numel(t));

% loops over the odd integers for 8 terms
for n = 1: 2: 17
    f = f + 52/pi * sin(n * t) / n;
end
% adds the first term a0/2 = -7 to f
f = f - 7;

% plot f vs t
figure
plot(t, f)
xlabel('t')
ylabel('f(t)')
grid on
axis tight
