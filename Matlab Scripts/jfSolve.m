function [J, f] = jfSolve(x)

df1dx1 =  3;
df1dx2 =  sin( x(2)*x(3) );
df1dx3 =  x(2) * sin(x(2) * x(3));

df2dx1 =  2 * x(1);
df2dx2 = -162 * (x(2) + 0.01);
df2dx3 =  cos( x(3) );

df3dx1 = -x(2) * exp(x(1) * x(2));
df3dx2 = -x(1) * exp(x(1) * x(2));
df3dx3 =  20;

J = [ df1dx1  df1dx2  df1dx3; 
      df2dx1  df2dx2  df2dx3; 
      df3dx1  df3dx2  df3dx3 ];

f1 = u( x(1), x(2), x(3) );
f2 = v( x(1), x(2), x(3) );
f3 = w( x(1), x(2), x(3) );

f=[f1; f2; f3];
end

function [f1] = u(x1, x2, x3)
    f1 = 3 * x1 - cos( x2*x3 ) - 0.5;
end
function [f2] = v(x1, x2, x3)
    f2 = x1*x1 - 81*(x2 + 0.01)^2 + sin(x3) + 1.06;
end
function [f3] = w(x1, x2, x3)
    f3 = exp(-x1*x2) + 20*x3 + (10*pi-3)/3;
end

