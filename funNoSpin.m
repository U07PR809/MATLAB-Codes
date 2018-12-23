function yDot = funNoSpin(t, y)
	% constants	
    d   =  0.063;
    m   =  0.05;
    g   =  9.8;
    w   =  29;
    eta =  0;
    rho =  1.29;        
    
    alpha = (rho * pi * d^2) / (8 * m) ;
    
	% rhs functions of system of ODEs       
    yDot(1) = y(2);
    
    v = sqrt( y(2)^2 + y(4)^2 ) ;
    C_D = 0.508 ;
    C_M = 0 ;
	yDot(2) = -C_D * alpha * v * y(2) + eta * C_M * alpha * v * y(4);
    
    yDot(3) = y(4);
    yDot(4) = -g - C_D * alpha * v * y(4) - eta * C_M * alpha * v * y(2);
    
	yDot = [yDot(1); yDot(2); yDot(3); yDot(4)];
end