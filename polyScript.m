clear; clc

p = [5 -27 45 -21  ];
q = [1 -5  8  -5  3];
x = 1 : 4;
y_p = polyval(p, x);
y_q = polyval(q, x);

X = x';
Yp = y_p';
Yq = y_q';

fprintf('p(x) = 5 x^3 - 27 x^2 + 45 x -21 \n')
Tp = table( X, Yp );
disp(Tp)

fprintf('q(x) = x^4 - 5 x^3 + 8 x^2 -5 x + 3 \n')
Tq = table( X, Yq );
disp(Tq)