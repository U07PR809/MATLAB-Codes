clear; clc;

a = 0.5;
b = 1.5;
N = 2 : 4;
trueValue = 1.93973485062365;

f = @(x) exp( cos(x) );

for iter = 1: length(N)
    [x, c] = gaussQuadWt( N(iter), a, b );
    value = sum( c .* f(x) );
    error = abs(value - trueValue);
    fprintf('Value with %d nodes is %0.14f\n', N(iter), value);
    fprintf('Error with %d nodes is %0.14f\n', N(iter), error);
    fprintf('---------------------------------------\n');
end


