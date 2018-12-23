function I = midSum(func, lowerLimit, upperLimit, numSegment)
% produces  the  left  sum  from  data  input.

% input:
% func = name of function to be integrated
% lowerLimit, upperLimit = integration limits
% numSegment = number of segments

% output:
% I = integral estimate

x = linspace(lowerLimit, upperLimit, numSegment+1);
I = 0;
for iter = 1: numSegment
    % accumulate  height  times  width
    I = I + func((x(iter) + x(iter+1))/2) * (x(iter+1) - x(iter));
end