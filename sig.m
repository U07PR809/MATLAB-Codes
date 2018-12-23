function [stdDev] = sig(dataArray)

numElem = numel(dataArray);
dataVec = dataArray(:);

mean = E(dataVec);
cumSum = 0;
for index = 1: numElem
    cumSum = cumSum + (dataVec(index) - mean)^2;
end

stdDev = sqrt( cumSum / (numElem - 1) );
end