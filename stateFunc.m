function zDot = stateFunc(t, z, k)
	% constants	    
    g = 9.81;
            
	% rhs functions of system of ODEs       
    zDot(1) = z(2);
    
    v = sqrt( z(2)^2 + z(4)^2 ) ;
    zDot(2) = -g - k * z(2) * z(2) * v ;
    
    zDot(3) = z(4);
    zDot(4) = -k * z(4) * v;
    
	zDot = [zDot(1); zDot(2); zDot(3); zDot(4)];
end