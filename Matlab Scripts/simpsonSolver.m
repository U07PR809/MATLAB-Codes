clear all; close all; clc
v = @(t) (exp(2*t)-1)./(exp(2*t)+1);
ytrue = @(t) log((exp(2*t)+1)/2) - t;
lowerLimit = 0;
upperLimit = 4;
stepSize = 0.2;
I = simpson(v, lowerLimit, upperLimit, stepSize);
relErr = abs(I/ytrue(4) - 1);
fprintf('The relative error is %0.5e \n', relErr)