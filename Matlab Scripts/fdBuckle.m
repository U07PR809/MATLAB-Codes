% constants
e  = 0.57;
P  = 2.1e3;
E  = 200e9;
L  = 6;
h  = 0.05;
d0 = 0.03;
I0 = pi*d0^4/64;
c0 = E*I0/P;
c1 = -e/L*h^2;

% discretize the height of the column
x = (0:h:L)';
numNodes = numel(x);

% main diagonal and the off diagonal vectors of the tri-diagonal matrix
offDiag  = c0 * (1 + x(2: numNodes-1)/L).^4;
mainDiag = h^2 - 2 * offDiag;

% constructs a sparse tri-diagonal coefficient matrix 
coeffMatrix = spdiags([offDiag, mainDiag, offDiag], [-1, 0, 1], numNodes-2, numNodes-2);

% plots the sparsity pattern of the coefficient matrix
figure
spy(coeffMatrix)
title('Sparse Pattern of Matrix A')

fprintf('The condition number of matrix A is %0.6e \n', condest(coeffMatrix))
fprintf('The determinant of matrix A is %0.6e \n', det(coeffMatrix))

b = c1 * x(2: numNodes-1);
deflection = coeffMatrix\b;

% adds boundary conditions as first and last element to the deflection vector
% estimated at inner nodes
% converts deflection from units (m) to (cm)
deflection = 100 * [0; deflection; 0]; 

fprintf('The maximum deflection is %0.2f cm \n', max(deflection))

% plots deflection with the height of the column
figure
plot(x, y, '-.o')
xlabel('x (m)')
ylabel('y (cm)')
title('Buckling of column of length L = 6 m under a point load P = 2.1 kN')
grid on; 
grid minor
