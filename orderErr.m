clear; clc;

f = @(x) exp(exp(x));

hMatrix = zeros(2, 4);
numVec = 1 : 4;
for index = 1 : 2
    hMatrix( index, : ) = (10 .^ (-numVec) ) / index;
end

errMat = zeros(2, 4);
for index = 1 : 2
    fprime_FD = ( - 3 * f(1) + 4 * f(1 + hMatrix( index, : )) - ...
                f(1 + 2 * hMatrix( index, : ))) ./ (2 * hMatrix( index, : )) ;
    fprime = exp( exp(1) + 1 );
    errMat( index, : ) = abs( fprime_FD - fprime );
end


orderMat = log2( errMat(1, :) ./ errMat(2, :) );

tableMat = [hMatrix(1, : )', errMat(1,:)', errMat(2,:)', orderMat'];
format long
fprintf('           h                 Err(h)            Err(h/2)             Order\n')
disp(tableMat)

