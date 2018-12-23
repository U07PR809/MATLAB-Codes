mu = 0;
sigma = 1;
gauss = @(x) 1/sigma/sqrt(2*pi)*(exp(-1/2*((x-mu)/sigma)^2));
numSegment =  1000;

I1  = midSum(gauss, -1*sigma, 1*sigma, numSegment);
I2  = midSum(gauss, -2*sigma, 2*sigma, numSegment);
I3  = midSum(gauss, -3*sigma, 3*sigma, numSegment);

% Display results
fprintf('Integrand: 1/sigma/sqrt(2*pi)*(exp(-1/2*(x/sigma)^2)) \n');
fprintf('Integration limits: %d to %d \n', -1*sigma, 1*sigma);
fprintf('Mid-point rectangular integral solution, ');
fprintf('I = %.7f \n', I1);

fprintf('Integration limits: %d to %d \n', -2*sigma, 2*sigma);
fprintf('Mid-point rectangular integral solution, ');
fprintf('I = %.7f \n', I2);

fprintf('Integration limits: %d to %d \n', -3*sigma, 3*sigma);
fprintf('Mid-point rectangular integral solution, ');
fprintf('I = %.7f \n', I3);


