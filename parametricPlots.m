clear; close all; clc
%% part 7
syms u v

x = u.^2;
y = v.^2;
z = u + v;
figure
fsurf(x, y, z, [-1 1 -1 1])

% title('ysin(x) - xcos(y) for x and y in [-2\pi,2\pi]')
xlabel('u^{2}')
ylabel('v^{2}')
zlabel('u + v')

%% part 8
syms u v

x = u;
y = v.^3;
z = -v;
figure
fsurf(x, y, z, [-2 2 -2 2])

% title('ysin(x) - xcos(y) for x and y in [-2\pi,2\pi]')
xlabel('u')
ylabel('v^{3}')
zlabel('-v')

%% part 9
syms u v

x = u .* cos(v);
y = u .* sin(v);
z = u^5;
figure
fsurf(x, y, z, [-1 1 0 2*pi])

% title('ysin(x) - xcos(y) for x and y in [-2\pi,2\pi]')
xlabel('u .* cos(v)')
ylabel('u .* sin(v)')
zlabel('u^5')

%% part 10
syms u v

x = u ;
y = sin(u + v);
z = sin(v);
figure
fsurf(x, y, z, [-pi pi -pi pi])

% title('ysin(x) - xcos(y) for x and y in [-2\pi,2\pi]')
xlabel('u')
ylabel('sin(u+v)')
zlabel('sin(v)')


%% part 11
syms u v

x = sin(v) ;
y = cos(u) * sin(4*v);
z = sin(2*u) * sin(4*v);
figure
fsurf(x, y, z, [0 2*pi -pi/2 pi/2])

% title('ysin(x) - xcos(y) for x and y in [-2\pi,2\pi]')
xlabel('sin(v)')
ylabel('cos(u) * sin(4*v)')
zlabel('sin(2*u) * sin(4*v)')

%% part 12
syms u v

x = sin(u) ;
y = cos(u) * sin(v);
z = sin(v);
figure
fsurf(x, y, z, [0 2*pi 0 2*pi])

% title('ysin(x) - xcos(y) for x and y in [-2\pi,2\pi]')
xlabel('sin(u)')
ylabel('cos(u) * sin(v)')
zlabel('sin(v)')


