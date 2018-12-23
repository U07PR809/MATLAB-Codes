syms y(t) 
ode = diff(y, t) == -exp(y) / ( t*exp(y) - sin(y) );
dsolve(ode)

% Yexpr = solve('cos(y) + t*exp(y) == -C12', 'C12')
