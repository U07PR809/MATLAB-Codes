clear; clc;
%% 
A = [10 1 -2 2; 2 -8 1 -3; 4 -1 7 2; 4 3 1 -9];
b = [-15 3 -22 19]';
% A = [4 -1 -1; -2 6 1; -1 1 7];
% b = [3 9 -6]';
%% Gauss Seidel Solver
gaussSeidel(A, b, 1e-4) 

%% Jacobi Solver
jacobi(A, b, 1e-4);