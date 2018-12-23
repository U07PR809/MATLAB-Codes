function zDot = func(t, z)
    % Evaluate the system of ODEs describing the trajectory of 
    % Planetary Motion
    % Here 
    % z(1) = x, z(2) = v_x, z(3) = y , z(4) = v_y    
	
    % rhs functions of system of ODEs       
    zDot(1) =   z(2);    
    zDot(2) = - z(1) / ( z(1)^2 + z(3)^2 );    
    zDot(3) =   z(4);    
    zDot(4) = - z(3)/ ( z(1)^2 + z(3)^2 );
    
	zDot = [zDot(1); zDot(2); zDot(3); zDot(4)];
end