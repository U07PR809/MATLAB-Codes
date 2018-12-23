clear all; close all; clc
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
xSpan = [xStart xEnd];
yL = poleLen - (width + 2*setback) * sin(bankAngle);

% initial guess for y'(0)
guessAngle1 = 0.5;
guessSlope1 = -cot(guessAngle1);

% initial guess for y'(0) corresponding to lower value of guess angle
y0 = poleLen;
yprime0 = guessSlope1;
initCond = [y0, yprime0];

[~, h] = ode45(@odefunc, xSpan, initCond);
hVec1 = h(:, 1);
estmHeight1 = hVec1(end);
disp(yL-estmHeight1)

% initial guess for y'(0)
guessAngle2 = 1.4;
guessSlope2 = -cot(guessAngle2);
% initial guess for y'(0) corresponding to upper value of guess angle
% such that yLower * yUpper < 0 i.e. estimated height of the pole on
% the other end
y0 = poleLen;
yprime0 = guessSlope2;
initCond = [y0, yprime0];

[~, h] = ode45(@odefunc, xSpan, initCond);
hVec2 = h(:, 1);
estmHeight2 = hVec2(end);
disp(yL-estmHeight2)

%% bisection method
numIter = 0;
lowerAngle = guessAngle1;
upperAngle = guessAngle2;
i = 1;
while(1)
    angle(i) = (lowerAngle + upperAngle)/2;
    disp(angle(i)*180/pi)
    yprime0 = -cot(angle(i));
    [x, h] = ode45(@odefunc, xSpan, [y0 yprime0]);
    hVec = h(:, 1);
    estmHeight(i) = hVec(end);
    
    numIter = numIter + 1;
    
    disp(numIter)
    if abs(yL - estmHeight(i)) < 0.05
        break;
    else
        test = (yL - estmHeight1) * (yL - estmHeight(i));
        if test < 0
            upperAngle = angle(i);
        else
            lowerAngle = angle(i);
			estmHeight1 = estmHeight(i);
        end
    end
    i = i+1;
end

fprintf('Solution was obtained in %i iterations. \n' , numIter)
root = fprintf('%0.2f \n', estmHeight(i)) ;
minHeight = min(h(:, 1));
fprintf('The minimum height of the cable is %0.2f. \n', minHeight)
figure
plot(x, h(:, 1))
grid on
grid minor

