% the region is bounded by the following curves
% 1) line y = 3, 
% 2) y = sqrt(x), and 
% 3) vertical line x = 0
% the bounded region is shown bounded by red, green and blue curves

x = linspace(0, 10);
y1 = 3 * ones(1, length(x));
y2 = sqrt(x);


figure
plot(x, y1, x, y2)

hold on

offset = 0.01;  % offset is given to show the line x = 0 in the plot 
line([offset, offset], [0, 3], 'Color', 'g')

% shows the point of intersection of the curve (1) and (2)
line([9, 9], [0, 3], 'Color', 'k', 'LineStyle', '--')

axis square
xlabel('x')
ylabel('y')
grid on
grid minor

hold off