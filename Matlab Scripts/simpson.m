function I = simpson(func, lowerLimit, upperLimit, stepSize)
% I = simpson(func, lowerLimit, upperLimit, numSegment):
% composite Simpson's 1/3 rule

% input:
% func = name of function to be integrated
% lowerLimit, upperLimit = integration limits
% numSegment = number of segments 

% output:
% I = integral estimate

if (lowerLimit > upperLimit)
    error('upper bound must be greater than lower')
end
numSegment = ceil((upperLimit - lowerLimit)/stepSize);
if (mod(numSegment, 2) ~= 0)
	error('number of sub-intervals must be even')
end

% numSegment = (upperLimit - lowerLimit) / stepSize;
x = linspace(lowerLimit, upperLimit, numSegment+1);

% Uses two separate loops to sum up the even and odd terms
% of Simpson's Rule. Also, excludes endpoints in the loop.
sumEven = 0;
for iterEven = 2 : 2 : numSegment
    sumEven = sumEven + func(x(iterEven));
end
sumOdd = 0;
for iterOdd = 3 : 2 : numSegment
    sumOdd = sumOdd + func(x(iterOdd));
end

sumEstimate = func(lowerLimit) + 4*sumEven + 2*sumOdd + func(upperLimit);
I = (upperLimit - lowerLimit) * sumEstimate/(3 * numSegment);

end
