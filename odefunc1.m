function dvdt = odefunc(t, v)
	% parameters of the ode :
    % dv/dt = g + k/m * sqrt(v)
	g = 9.81;
    k = 3;
    m = 2;
	% rhs of the ODE	
	dvdt = g + k/m * sqrt(v);
end