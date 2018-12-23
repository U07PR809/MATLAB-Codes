clear all; close all; clc

falsePosition(@(x) x - cos(x), 0.5, pi/4, 1e-2)
% fprintf('%0.10f \n', xi)