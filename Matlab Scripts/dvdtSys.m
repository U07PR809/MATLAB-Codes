function dvdt = dvdtSys(t, v)
% dvdt = dvdtSys(t, v):system of first order differential   
% equations governing the volume of water in each tank

% input:
% t = vector of independent variable
% v = vector of solution for dependent variables

% output:
% dvdt = vector of rhs of the system of the first order ODEs

    dv1dt = 0.02 * v(1) - 0.01 * v(1) * v(2);        
    dv2dt = 0.002 * v(1) * v(2) - 0.1* v(2);    
        
    dvdt = [dv1dt dv2dt];
end
