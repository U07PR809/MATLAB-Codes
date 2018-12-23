clear all; close all; clc
% f = @ (x) 
numInterval = 10;
while (1)
   [x, y] = eulMod(@dydx, [0 1], 1, numInterval);
   if abs(y(end) - exp(1)) <= 1e-6
       fprintf('The value of y(1) is %0.5f \n', y(end))
       fprintf('The number of subintervals required are %i \n', numInterval)
       break
   end
   numInterval = 2 * numInterval;
end
% [t, y] = eulBwd(@dydtsys, [0 1], [1 0.5 0], 0.01);

% [t, y2] = eulOde(@dydtsys, [0 1.5], [1.1 -4.7 7.9 -14.3], 0.03);
% v = y2(:, 1);
% w = v(1: 3: end);
% u = w(1: end-1);
% [t, y3] = midOde(@dydtsys, [0 1.5], [1.1 -4.7 7.9 -14.3], 0.1);
% 
% y0 = 2*exp(-2*t)- 0*exp(-t)- 1*exp(t)+ 0.1*exp(3*t);
% 
% figure
% plot(t, y0)
% hold on
% 
% figure
% plot(x, y)
% disp(y(end))
% plot(t, y(:, 1))
% 
% figure
% plot(t, y(:, 2))
% 
% figure
% plot(t, y(:, 3))

% plot(t, u)
% plot(t, y3(:, 1))
% 
% xlabel('x')
% ylabel('u(x)')
% grid on
% grid minor
% legend('analytical', 'euler(0.1)', 'euler(0.03)', 'mid-point')
% axis square

f=@(x,y) x./y;
% Calculate exact solution
% g=@(x) sqrt(x.^2+1);
% xe=[0:0.01:0.3];
% ye=g(xe);
% [x3,y3]=eulBwd(f, [0 1] ,0.3, 1/6);
% 
% error3=['Backward error: ' num2str(-100*(ye(end)-y3(end))/ye(end)) '%'];
% 
