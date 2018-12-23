%% creating x- and y- nodes
x = linspace(0, 2*pi);
y = linspace(0, 2*pi);
[X,Y] = meshgrid(x,y);

%% expressions for u, v and w(z-vorticity)

u =  cos(X) .* sin(Y) ;
v = -sin(X) .* cos(Y) ;
w = -2 * cos(X).* cos(Y) ;

%% u-velocity contour
figure
contourf(X,Y,u)
title('u contour')
xlabel('x')
ylabel('y')
axis square

%% v-velocity contour
figure
contourf(X,Y,v)
title('v contour')
xlabel('x')
ylabel('y')
axis square

%% z-vorticity contour
figure
contourf(X,Y,w)
title('vorticity contour')
xlabel('x')
ylabel('y')
axis square

%% velocity field
skip = 4;
figure
quiver(X(1:skip:end,1:skip:end),Y(1:skip:end,1:skip:end),...
        -v(1:skip:end,1:skip:end),-u(1:skip:end,1:skip:end))
title('velocity vectors')
xlabel('x')
ylabel('y')
axis square