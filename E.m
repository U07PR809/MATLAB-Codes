function [mean] = E(dataArray)

numElem = numel(dataArray);
dataVec = dataArray(:);

cumSum = 0;
for index = 1: numElem
    cumSum = cumSum + dataVec(index);
end

mean = cumSum / numElem;
end

