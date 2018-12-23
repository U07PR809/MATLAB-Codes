clear; close all; clc;
% Reads 'Data1.xls' file
filename = 'Data1.xls';
data = xlsread(filename);

x1 = data(:, 1); % Concentration of Polymer 1
x2 = data(:, 2); % Concentration of Polymer 2
y = data(:, 3); % Fiber Strength

% Fits a surface Using the variables x, y, z
sf = fit([x1, x2], y, 'poly22')

% Plot
figure
plot(sf, [x1,x2], y)
xlabel('\bf x_{1}')
ylabel('\bf x_{2}')
zlabel('\bf y')