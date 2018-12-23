clear all; close all; clc
xSpan = [0 5];
y0 = 0;
stepSize = [0.025, 0.05, 0.1];
yEnd = zeros(1, length(stepSize));

for iter = 1: length(stepSize)
    [x, y] = rk4(@rhs, xSpan, y0, stepSize(iter));
    skip = ceil((1-xSpan(1))/stepSize(iter));
    start = ceil(skip+stepSize(iter));
    error = abs(y(skip: skip: end) ./ x(start: skip: end).^1.1 - 1);
    disp([x(start: skip: end)', y(skip: skip: end)', error'])
%     yEnd(iter) = y(end);
end
% ytrue = xSpan(2)^1.1;
% globalError = abs(yEnd - ytrue);

% % Plots
% figure
% loglog(stepSize, globalError, '--o')
% grid on
% xlabel('step size')
% ylabel('global error')
% head = sprintf('[0 %0.2f]',xEnd(ii));
% title(head)
% %     xlim(xSpan)
% % xSpan = [0 1];
% 
% 



