function dotVec = Lorenz (t, x)
% Solution of the Lorenz equations:
%     dx/dt = -10x + 10y
%     dy/dt =  25x - y - xz
%     dz/dt = -8/3z + xy 

% x, y, and z are represented by x(1), x(2), and x(3)
% the vector f hold the right-hand sides of the system

xdot = - 10 * x(1) + 10 * x(2);
ydot = 25 * x(1) - x(2) - x(1) * x(3);
zdot = - 8/3 * x(3) + x(1) * x(2);
dotVec = [xdot; ydot; zdot];
end

