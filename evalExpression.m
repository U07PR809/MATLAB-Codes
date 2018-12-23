x = 2.2502381195;
y = x + ( exp(-1.3*x)-1.3*x^2+6.5 )/(1.3*(exp(-1.3*x)+2*x));
fprintf('%0.10f \n', y)
fprintf('%0.10f \n', abs(x - y))