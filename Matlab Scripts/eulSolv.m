% parameters of the ode :
% dy/dt = -a/A*sqrt(2*g*y)
a = 1;
A = 10;
g = 9.81;
H0 = 9.81;

% function handle
dydt  =  @ (t,y) -a/A * sqrt(2*g*t);

% initial time
tinitial = 0;
% time step
tStep = 0.001;
% final time
tfinal = tinitial + tStep;
while 1   
    [t,y] = eulode(dydt,[tinitial tfinal], H0, tStep);
    if y(end) < 0
            break
    end
    tfinal = tfinal + tStep;
end
 
fprintf('The time required for tank to get empty is %0.3f s.\n', t(end));
plot(t, y)
xlabel('t')
ylabel('h(t)')
hline = refline(0, 0);
hline.Color = 'r';

