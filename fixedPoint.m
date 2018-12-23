clear
maxIter = 100;
x0  = 0.5 ;     %initial guess
% ea = 0.1 ;       %tolerance
es = 1e-6;       %randomly large relative approximate error

xr = x0;   
n  = 0;      %iteration counter

while (1)
    xrold = xr;
    xr = 2 * (exp(xr) - xr^3 - 2);
    disp(xr)
    n = n + 1;
    if xr~= 0, ea = abs((xr-xrold)/xr)*100; end;
    if ea <= es || n > maxIter, break, end
end

root = xr;
