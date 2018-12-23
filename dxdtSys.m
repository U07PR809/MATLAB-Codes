function dxdt = dxdtSys(t, x)
    dxdt(1) = x(2);
    dxdt(2) = 2*(100 - 0.75*x(2) - x(1).^3);
end
