function atan = arcTan(x, numTerms)

numVec = 0 : numTerms;
termsVec = ( (-1).^numVec )./ (2 * numVec + 1) .* x.^(2 * numVec + 1);
atan = sum(termsVec);

end

