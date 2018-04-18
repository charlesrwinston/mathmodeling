function [topPages, topProbs] = getTopPages(steadyState, websites, n)

[output, indices] = sort(steadyState, 'descend');
topPages = string(zeros(n,1));
topProbs = zeros(n,1);

for i = 1:n
    index = indices(i);
    disp(index);
    topPages(i) = websites(index);
    topProbs(i) = output(i);
end

end