function x = jacobi(A, b, tol)
% Jacobi method
% x = jacobi(A, b, tol)

% input:
% A = coefficient matrix
% b = right hand side vector
% tol = tolerance, stopping criterion

% output:
% x = solution vector

[nRows, nCols] = size(A);
% check for Square Matrix
if nRows ~= nCols
    error('Matrix must be square');
end

% check for Diagonal Dominance
for m = 1: nRows
    mthRow = abs(A(m, :));
    d = sum(mthRow) - mthRow(m);
    if mthRow(m) < d
        %         fprintf('The matrix is not strictly diagonally dominant')
        error('Matrix is not diagonally dominant');
    end
end

% creates Diagnonal Matrix D
D = diag(diag(A));

% sets Initial Guess
x0 = zeros(nRows, 1);
x = x0;

iter = 0;
err = inf;
while err > tol
    
    % update [x]
    dx = D\(b - A*x);
%     disp(dx)
    x =  x + dx;
%     disp(x)
    
    % estimate error
    err = max(abs(dx./x));
    iter = iter + 1;
end

% displays Result
disp(['Jacobi method converges after ' num2str(iter) ' iterations' ' x = ' mat2str(x) '.']);
% input:
% A = coefficient matrix
% b = right hand side vector
% tol = tolerance, stopping criterion
end
