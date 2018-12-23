clear; clc;
%% Sets A, b
% A = coefficient matrix
% b = right hand side vector

% diagonally dominant matrix
A = [10 1 -2 2; 2 -8 1 -3; 4 -1 7 2; 4 3 1 -9];
b = [-15 3 -22 19]';

%% Gauss Seidel Solver
% input:
% A = coefficient matrix
% b = right hand side vector
% tol = tolerance, stopping criterion
gaussSeidel(A, b, 1e-4);

%% Jacobi Solver
% input:
% A = coefficient matrix
% b = right hand side vector
% tol = tolerance, stopping criterion
jacobi(A, b, 1e-4);