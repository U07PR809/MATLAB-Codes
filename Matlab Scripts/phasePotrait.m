skip = 1;
Y1 = -13: skip: 13;
Y2 = -13: skip: 13;
[y1, y2] = meshgrid(Y1, Y2);

y1dot = -3*y1 + 6*y2;
y2dot = -2*y1 + y2;

figure
quiver(y1, y2, y1dot, y2dot)
xlabel('y_{1}')
ylabel('y_{2}')
title('Phase Plot')
axis square
axis tight
grid on

hold on
[t, yy] = ode45(@func, [0 20], [-7 7]);
plot(yy(:, 1), yy(:, 2))