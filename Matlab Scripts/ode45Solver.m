L = 12;
C = 0.049;
width = 19.5;
setback = 2;
slope = pi/30;
xStart = 0;
xEnd = (width + 2*setback) * cos(slope);
xspan = [xStart xEnd];
y0 = [12 -tan(pi/4)];
[x, y] = ode45(@(x,y) odefcn(x, y, C), xspan, y0);
plot(x, y(:,1), '-.')
y1 = y(:, 1);
y1(end)
yL = L - (width + 2*setback) * sin(slope);