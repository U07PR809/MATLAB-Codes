[m, n] = size(A);
[k, l] = size(B);

if( m == 0 || n == 0 || k == 0 || l == 0 || n ~= k )
    error('Matrices Inner Dimensions Inconsistent for Matrix Multiplication');
end

C = zeros(m, 1);
for ii = 1:m
        for jj = 1:l
            for pp = 1:n
                C(ii, jj) = C(ii, jj) + A(ii, p)*B(p, jj);
            end            
        end
end