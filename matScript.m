clear; clc;

numRows = input('Enter the number of rows: ');
numCols = input('Enter the number of columns: ');

numRows = uint8(numRows);
numCols = uint8(numCols);

A = zeros(numRows, numCols);
A(1, :) = 1 : numCols;
A(:, 1) = 1 : numRows;

for k = 1 : numRows
    for h = 1 : numCols        
        if k > 1 && h > 1
            A(k, h) = A(k, h-1) + A(k-1, h);
        end
    end
end