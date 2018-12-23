% ode
paramC = 0.049;
% road 
width = 19.5;
setback = 2;
bankAngle = pi/30;
poleLen = 12;

% span of x, domain 
xStart = 0;
xEnd = (width + 2*setback) * cos(bankAngle);
xspan = [xStart xEnd];
yL = poleLen - (width + 2*setback) * sin(bankAngle);

% initial guess for y'(0)
guessAngle = ;
guessSlope = -cot(guessAngle);

% initial guess for y'(0) corresponding to lower value of guess angle
y0 = poleLen;
yprime0 = guessSlope1;
initCond = [y0, yprime0];


[~, h] = ode45(@(x,y) odefunc(x, y), xSpan, initCond);
hVec1 = h(:, 1);
estmHeight1 = hVec1(end);
disp(estmHeight1)

% initial guess for y'(0) corresponding to upper value of guess angle
% such that yLower * yUpper < 0 i.e. estimated height of the pole on 
% the other end
y0 = poleLen;
yprime0 = guessSlope2;
initCond = [y0, yprime0];

[~, h] = ode45(@(x,y) odefcn(x, y, C), xspan, initCond);
hVec2 = h(:, 1);
estmHeight2 = hVec2(end);
disp(estmHeight2)

% bisection method
numIter = 0;
while(1)
    angle = (lowerAngle + upperAngle)/2;
	yprime0 = -cot(angle);
	[~, h] = ode45(@(x,y) odefcn(x, y, C), xspan, [y0 yprime0]);
	hVec = h(:, 1);
	estmHeight = hVec(end);

	numIter = numIter + 1;
	if abs(yL - estmHeight) < 0.05
		break;
	else
		test = estHeight1 * estHeight;
		if test < 0
			upperAngle = angle;
		else
			lowerAngle = angle;
		end		
	end
end

fprintf('Solution was not obtained in %i iterations. \n' , numIter)
root = fprintf('%0.2f \n', estHeight) ;

