function [T, X] = myeuler (f, x0, a, b, n)
% eulode: Euler ODE solver
% [T, X] = myeuler (f, x0, a, b, n):
% uses Euler's method to integrate an ODE

% input:
% f = name of the function M−file that evaluates the ODE
% tspan = [a, b] where a and b are initial and
% final values of the independent variable, t
% x0 = initial value of dependent variable, x
% n = number of iterations or steps

% output:
% T = vector of independent variable, t
% X = solution vector of dependent variable, x

tInitial = a;
tFinal   = b;
T = linspace(tInitial, tFinal, n+1)';

X = x0*ones(n+1, 1);
X(1) = x0;

for i = 1: length(T)-1   
    X(i + 1) = X(i) + f(T(i), X(i)) * (T(i+1) - T(i));
end
end

