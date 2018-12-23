function [ Y ] = mydft( y )
% function [ Y ] = mydft( y ) 
% implements discrete Fourier Transform using FFT algorithm

% input:
% y = column vector of length N

% output:
% Y = column vector of length N

N = length(y);
Y = zeros(N, 1);

for k = 1: N
    Y(k) = 0;
    for n = 1: N
        Y(k) = Y(k) + y(n)* exp(-1j*2*pi*(n-1)*(k-1) / N);
    end
end

end

