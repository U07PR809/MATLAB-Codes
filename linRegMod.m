clear; close all; clc;
%% part 1
% Data
x1 = [0 2 4 6 9 11 12 15 17 19]';
y1 = [5 6 7 6 9  8  8 10 12 12]';

% Fit includes y-intercept b(1) and slope b(2)
X1 = [ones(length(x1), 1) x1];
b1 = X1 \ y1;

% Calculate Value of y using the Fit
yCalc1 = X1 * b1;

% Plot
figure
scatter(x1, y1)
hold on
plot(x1, yCalc1)
xlabel('x')
ylabel('y')
legend('Data', 'Fit')
grid on

% Pearsons Correlation Coefficient
Rsq1 = 1 - sum((y1 - yCalc1).^2)/sum((y1 - mean(y1)).^2);
r1 =  sqrt(Rsq1);

% Standard Error of the Estimate
stdErr1 = sqrt( sum((y1 - yCalc1).^2)/length(x1) );

fprintf('The correlation coefficient (r) is %0.2f\n', r1)
fprintf('The standard error (sigma) is %0.3f\n', stdErr1)

%% part 2
% Data
x2 = y1;
y2 = x1;

% Fit includes y-intercept b(1) and slope b(2)
X2 = [ones(length(x2), 1) x2];
b2 = X2 \ y2;

% Calculate Value of y using the Fit
yCalc2 = X2 * b2;

% Plot
figure
scatter(x2, y2)
hold on
plot(x2, yCalc2)
xlabel('x')
ylabel('y')
legend('Data', 'Fit')
grid on

% Pearsons Correlation Coefficient
Rsq2 = 1 - sum((y2 - yCalc2).^2)/sum((y2 - mean(y2)).^2);
r2 =  sqrt(Rsq2);

% Standard Error of the Estimate
stdErr2 = sqrt( sum((y2 - yCalc2).^2)/length(x2) );

fprintf('The correlation coefficient (r) after switching is %0.2f\n', r2)
fprintf('The standard error (sigma) after switching is %0.3f\n', stdErr2)