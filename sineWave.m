clear; clc; close all;

A = input('Please input the amplitude of Sine wave: ');
f = input('Please input the frequency (in hertz) of Sine wave: ');

T = 1/f;
w = 2*pi*f;

fprintf('The period of the Sine wave is:             %0.3f s \n', T);
fprintf('The angular frequency of the Sine wave is: %0.3f rad/s \n', w);

figure
fplot( @(t) A * sin(2 * pi * f * t), [-T, T]);

xlabel('\bf t');
ylabel('\bf A sin(2 \pi f t)');
grid on