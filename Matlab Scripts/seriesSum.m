function [ series_sums, approx_rel_error, true_rel_error  ] = seriesSum( x, number_of_sums )
% function [ series_sums, approx_rel_error, true_rel_error  ] = student_solution( x, number_of_sums )
% used to approximate the sine of x with increasing accuracy as terms 
% are added to the summation

% input:
% x = value about which series is to be evaluated, in radians
% number_of_sums = number of series sums

% output:
% series_sums = column vector of the first N series summations
% approx_rel_error = column vector of the absolute value of the 
% approximate relative error associated with the first N series summations
% true_rel_error = column vector of the true relative error values 
% associated with the first N series summations

x0 = x;  
nTerms = number_of_sums; % number of terms in the truncated series
accum = 0;
cumSum = zeros(nTerms, 1);
term = zeros(nTerms, 1);

for iter = 1: nTerms
    term(iter) = x0 ^ (2*iter-1) / factorial(2*iter-1);
    accum = accum + term(iter);
    cumSum(iter) = accum;
end

series_sums = cumSum;
approx_rel_error = diff(cumSum) ./ cumSum(2: end);
true_rel_error = abs(cumSum - sin(x)) / abs(sin(x));
end

