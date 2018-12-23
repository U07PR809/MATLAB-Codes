close all; clear; clc
%% Time Interval & Initial Conditions

% initial time
tStart = 0;
% time step-size
tStep = 1e-4;
% final time
tEnd = tStart + tStep;

% initial conditions
v0     = 25;
h      = 1.4;
theta0 = 20 * pi/180;
y0     = [0 v0*cos(theta0) h v0*sin(theta0)];

%% With Spin Analysis 

while 1
    
    [tSpin, ySpin] = ode45(@funWithSpin, [tStart, tEnd], y0);
    
    zSpin = ySpin(:, 3);
    if zSpin(end) <= 0
        break;
    end
    
    tEnd = tEnd + tStep;
end

fprintf('The Time of Flight (with Spin) is, t(z = %0.2f m) = %0.2f s.\n', abs(zSpin(end)), tSpin(end));
xSpin = ySpin(:, 1);
fprintf('The Maximum Horizontal Distance (with Spin) is x(t = %0.2f s) = %0.2f m.\n', tSpin(end), xSpin(end));



%% No Spin Analysis

while 1
    
   [tNoSpin, yNoSpin] = ode45(@funNoSpin, [tStart, tEnd], y0);
   
   zNoSpin = yNoSpin(:, 3);
   if zNoSpin(end) <= 0
    break;
   end
   
   tEnd = tEnd + tStep;
end

fprintf('The Time of Flight (No Spin) is, t(z = %0.2f m) = %0.2f s.\n', abs(zNoSpin(end)), tNoSpin(end));
xNoSpin = yNoSpin(:, 1);
fprintf('The Maximum Horizontal Distance (No Spin) is x(t = %0.2f s) = %0.2f m.\n', tNoSpin(end), xNoSpin(end));

%% In Vacuum Analysis 

while 1
    
   [tVac, yVac] = ode45(@funVacuum, [tStart, tEnd], y0); 
   
   zVac = yVac(:, 3);
   if zVac(end) <= 0
    break;
   end
   
   tEnd = tEnd + tStep;
end

fprintf('The Time of Flight (in Vacuum) is, t(z = %0.2f m) = %0.2f s.\n', abs(zVac(end)), tVac(end));
xVac = yVac(:, 1);
fprintf('The Maximum Horizontal Distance (No Spin) is x(t = %0.2f s) = %0.2f m.\n', tVac(end), xVac(end));

%% Plots 

figure
plot(tSpin, ySpin(:, 1), '--', tNoSpin, yNoSpin(:, 1), ':', tVac, yVac(:, 1))
xlabel('t')
ylabel('x(t)')
legend('with Spin', 'no Spin', 'Vacuum')

figure
plot(tSpin, ySpin(:, 3), '--', tNoSpin, yNoSpin(:, 3), ':', tVac, yVac(:, 3))
hline = refline(0, 0);
hline.Color = 'k';
xlabel('t')
ylabel('z(t)')
legend('with Spin', 'no Spin', 'Vacuum')

figure
plot(ySpin(:, 1), ySpin(:, 3), '--', yNoSpin(:, 1), yNoSpin(:, 3), ':', yVac(:, 1), yVac(:, 3))
xlabel('x')
ylabel('z')
hline = refline(0, 0);
hline.Color = 'k';
title('Trajectory of the Ball')
legend('with Spin', 'no Spin', 'Vacuum')

%% With Spin Analysis 

function yDot = funWithSpin(t, y)
    % Evaluate the system of ODEs describing the trajectory of a Spinning
    % Tennis Ball
    % Here 
    % y(1) = x, y(2) = v_x, y(3) = z , y(4) = v_z    
	
    % constants	
    d   =  0.063;
    m   =  0.05;
    g   =  9.8;
    w   =  29;
    eta =  1;
    rho =  1.29;        
    
    alpha = (rho * pi * d^2) / (8 * m) ;
    
	% rhs functions of system of ODEs       
    yDot(1) = y(2);
    
    v = sqrt( y(2)^2 + y(4)^2 ) ;
    C_D = 0.508 + ( 1 / (22.053 + 4.196 * (v/w)^(5/2)) )^(2/5) ;
    C_M = 1 / ( 2.022 + 0.981 * (v/w) ) ;
	yDot(2) = -C_D * alpha * v * y(2) + eta * C_M * alpha * v * y(4);
    
    yDot(3) = y(4);
    yDot(4) = -g - C_D * alpha * v * y(4) - eta * C_M * alpha * v * y(2);
    
	yDot = [yDot(1); yDot(2); yDot(3); yDot(4)];
end

%% No Spin Analysis

function yDot = funNoSpin(t, y)
    % Evaluate the system of ODEs describing the trajectory of a Spinning
    % Tennis Ball
    % Here 
    % y(1) = x, y(2) = v_x, y(3) = z , y(4) = v_z
    
	% constants	
    d   =  0.063;
    m   =  0.05;
    g   =  9.8;
    w   =  29;
    eta =  0;
    rho =  1.29;        
    
    alpha = (rho * pi * d^2) / (8 * m) ;
    
	% rhs functions of system of ODEs       
    yDot(1) = y(2);
    
    v = sqrt( y(2)^2 + y(4)^2 ) ;
    C_D = 0.508 ;
    C_M = 0 ;
	yDot(2) = -C_D * alpha * v * y(2) + eta * C_M * alpha * v * y(4);
    
    yDot(3) = y(4);
    yDot(4) = -g - C_D * alpha * v * y(4) - eta * C_M * alpha * v * y(2);
    
	yDot = [yDot(1); yDot(2); yDot(3); yDot(4)];
end

%% In Vacuum Analysis

function yDot = funVacuum(t, y)
    % Evaluate the system of ODEs describing the trajectory of a Spinning
    % Tennis Ball
    % Here 
    % y(1) = x, y(2) = v_x, y(3) = z , y(4) = v_z
    
	% constants	
    d   =  0.063;
    m   =  0.05;
    g   =  9.8;
    w   =  29;
    eta =  0;
    rho =  1.29;        
    
    alpha = (rho * pi * d^2) / (8 * m) ;
    
	% rhs functions of system of ODEs       
    yDot(1) = y(2);
    
    v = sqrt( y(2)^2 + y(4)^2 ) ;
    C_D = 0 ;
    C_M = 1 / ( 2.022 + 0.981 * (v/w) ) ;
	yDot(2) = -C_D * alpha * v * y(2) + eta * C_M * alpha * v * y(4);
    
    yDot(3) = y(4);
    yDot(4) = -g - C_D * alpha * v * y(4) - eta * C_M * alpha * v * y(2);
    
	yDot = [yDot(1); yDot(2); yDot(3); yDot(4)];
end

