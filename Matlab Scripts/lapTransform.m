syms t s 
f = sin(4 * (t-3)); 
F = laplace(f, t, s);

g = (2 * t-1)^2;
G = laplace(g, t, s);

h = t^(3/2);
H = laplace(h, t, s);
