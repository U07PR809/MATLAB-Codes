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
% check for square matrix
if nRows ~= nCols 
    error('Matrix must be square'); 
end

% check for diagonal dominance
for m = 1: nRows
    mthRow = abs(A(m, :));
    d = sum(mthRow) - mthRow(m);
    if mthRow(m) < d
        error('Matrix is not diagonally dominant');
    end
end

% initial guess
x0 = ones(nRows, 1);
x = x0;

% diagnonal matrix D
D = diag(diag(A));

iter = 0;
err = inf;
while err > tol
    % update [x]
    dx = D\(b - A*x);
    x =  x + dx;
    % estimate error
    err = max(abs(dx./x));    
    iter = iter + 1;
end

% display result
disp(['Converge after ' num2str(iter) ' iterations' ' x = ' mat2str(x) '.']);

end
