function dydx = odefunc(x, y)
	% constants
	C = 0.049;
	% rhs functions of system of ODEs	
	dydx(1) = y(2);
	dydx(2) = C * sqrt(1 + y(2)^2);
	dydx = [dydx(1); dydx(2)];
end
