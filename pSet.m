clear; clc; close all;
%% part (a)

p = [ -2 5 8 ];
r = roots(p);

%% part (b)

x = linspace( -5, 5 );
y = polyval( p, x );

figure
plot( x, y )

hline = refline( [ 0 0 ] );
hline.Color = 'r';

xlabel( "x" )
ylabel( "f'(x)" )
grid on
grid minor

