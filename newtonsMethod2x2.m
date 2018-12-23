function [r, numIter] = newtonsMethod2x2(x0, y0, f1, f2, df1dx, df2dx, df1dy, df2dy, tol)

% Use the Jacobian to solve for the roots

J = [df1dx(x0, y0), df1dy(x0, y0); df2dx(x0, y0), df2dy(x0, y0)];
r = [x0, y0]';
f = [f1(x0, y0); f2(x0, y0)];

numIter = 0;
x = 0;
y = 0;

while (1)
    r = r - inv(J) * f;
    
    % update r, J and f
    x = r(1);
    y = r(2);
    J = [df1dx(x, y), df1dy(x, y); df2dx(x, y), df2dy(x, y)];
    r = [x, y]';
    f = [f1(x, y); f2(x, y)];
    numIter = numIter + 1;
    
    relErr = max( abs( (inv(J)*f)/r) );
    if relErr <= tol
        break
    end
end
end