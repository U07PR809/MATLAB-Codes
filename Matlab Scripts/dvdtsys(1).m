function dvdt = dvdtsys(t, v)
    dv1dt = -2 * v(1) + v(2) + 5 ;
        
    dv2dt =  2 * v(1) - 6 * v(2) + 2 * v(3);
    
    dv3dt = 5 * v(2) - 2 * v(3) - 0.1;
    
    dvdt = [dv1dt dv2dt dv3dt];
end
