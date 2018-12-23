xLower = 3;    % lower guess of x
xUpper = 9;    % upper guess of x
es = 0.05;     % tolerance
theta = pi/18; % angle in radians

[xVal, fVal, ea, numIter] = bisect( @equation, xLower, xUpper, es );
yVal = xVal * tan(theta);

fprintf('The x-coordinate of the basket is %0.2f m. \n', xVal)
fprintf('The y-coordinate of the basket is %0.2f m. \n', yVal)
