B = round( 10 * rand(6, 3) );
X = round( 10 * rand(3, 4) );
C = B * X;
A = [B C];
rank(A)