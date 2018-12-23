function x = gaussSeidel(A, b, tol)
% Gauss Siedel method
% x = gaussSiedel(A, b, tol)

% input:
% A = coefficient matrix
% b = right hand side vector
% tol = tolerance, stopping criterion

% output:
% x = solution vector

[nRows, nCols] = size(A);
% checks for Square Matrix
if nRows ~= nCols
    error('Matrix must be square');
end

% checks for Diagonal Dominance
for m = 1: nRows
    mthRow = abs(A(m, :));
    d = sum(mthRow) - mthRow(m);
    if mthRow(m) < d
        %         error('Matrix is not diagonally dominant');
        fprintf('The matrix is not strictly diagonally dominant')
    end
end

% sets Initial Guess
x0 = zeros(nRows, 1);
x = x0;

% creates Diagnonal Matrix D
D = diag(diag(A));

% starts the Iterative Method

iter = 0;
err = inf;
U = triu(A, -1);
while err > tol
    
    % update [x]
    dx = (A-U) \ (b - A*x);
    x =  x + dx;
    
    % estimate error
    err = max(abs(dx./x));
    iter = iter + 1;
end

% displays Result
disp(['Converge after ' num2str(iter) ' iterations' ' x = ' mat2str(x) '.']);
end