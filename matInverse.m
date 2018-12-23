clear; clc
%% part (a)
n = 200;
A = floor( 10 * rand(n) );
b = transpose( sum( transpose(A) ) );
z = ones(n, 1);

tic
x = A\b;
toc
tic
y = inv(A) * b;
toc

max( abs(x-z) )
max( abs(y-z) )

%% part (b)
n = 500;
A = floor( 10 * rand(n) );
b = transpose( sum(transpose(A)) );
z = ones(n, 1);

tic
x = A\b;
toc

tic
y = inv(A) * b;
toc

max( abs(x-z) )
max( abs(y-z) )
