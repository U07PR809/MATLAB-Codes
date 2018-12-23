func = @(x) x .* sqrt(1 + x.*x);
a = 2; b = 4;
I = gaussQuad(func,a,b, 4);