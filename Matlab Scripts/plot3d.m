%% 3d Plot
X = linspace(-4, 4);
Y = linspace(-4, 4);
[x,y] = meshgrid(X, Y);

z1 = zeros(length(X), length(Y));
z2 = 54*exp(-(x.^2 + y.^2)/4 );

figure
s1=surf(x, y, z1, 'FaceColor', 'k');
s1.EdgeColor = 'none';
hold on

s2=surf(x, y, z2, 'FaceAlpha', 0.5);
% s2.EdgeColor = 'none';
colormap('jet')

r0 = 4;
[x,y,z] = cylinder(r0, 200);
z = z * 54*exp(-4);
s3 = surf(x,y,z, 'FaceColor', 'w');
s3.EdgeColor = 'none';
hold off

axis square
view([-60 30])
xlabel('x')
ylabel('y')
zlabel('z')
title( 'view([-60 30])' )


