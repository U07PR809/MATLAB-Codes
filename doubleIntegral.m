surfFunc = @(theta, phi) sqrt(9*(cos(theta)).^4 .* (4*(cos(phi)).^2 + ...
                    9*(sin(phi)).^2) + 4*(cos(theta)).^2 .* (sin(theta)).^2);
thetaMin = 0;
thetaMax = pi;
phiMin = 0;
phiMax = 2*pi;

surfaceArea = integral2(surfFunc, thetaMin, thetaMax, phiMin, phiMax);
disp(['The surface area of the ellipsoid is ' num2str(surfaceArea)])