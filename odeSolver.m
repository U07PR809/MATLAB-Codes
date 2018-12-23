close all; clear all; clc
%%
% initial time
tStart = 0;
% time step-size
tStep = 1e-4;
% final time
tEnd = tStart + tStep;

% initial velocity
v0 = -8;

while 1
   [t, v] = ode45(@(t, v) odefunc(t, v), [tStart, tEnd], v0); 
   if v(end) > 0
       break;
   end
   tEnd = tEnd + tStep;
end

fprintf('The time at which v = %0.2f is %0.2f s.\n', v(end), t(end));
% plot velocity vs time
plot(t, v)
xlabel('t')
ylabel('v(t)')
hline = refline(0, 0);
hline.Color = 'r';

%%
% initial time
tStart = 0;
% final time
tEnd = 2;

tSpan = [tStart tEnd];
v0 = -8;
[t, v] = ode45(@(t, v) odefunc(t, v), tSpan, v0);

fprintf('The velocity at time t = 2 is %0.2f \n', v(end))
