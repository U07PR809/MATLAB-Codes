timeSpan = [0 4];
v0 = 0;
stepSize = 0.2;
[t, y] = rk4(@dydt, timeSpan, v0, stepSize);

ytrue = (exp(2*t)-1)./(exp(2*t)+1);

% Plots
figure
plot(t, y, 'o', t, ytrue)
legend('RK4', 'analytical')
xlabel('time (t)')
ylabel('velocity magnitude (v)')
xlim([0 4])