function [bp] = BinPr(n, k, p)

numElem = numel(n);
bp = zeros(1, numElem);

for index = 1: numElem
    bp(index) = factorial(k) / (factorial(k-n(index)) * factorial(n(index))) * ...
         p^n(index) * (1-p)^(k-n(index));
end

end