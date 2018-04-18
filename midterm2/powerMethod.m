function [steadyStatePower, topPagesPower, topProbsPower, k] = powerMethod(P, websites, topPages)

x0 = zeros(500, 1);
x0(1) = 1;
steadyStatePower = P * x0;
[topPagesPower, topProbsPower] = getTopPages(steadyStatePower, websites, 10);
k = 1;
while ~isequal(topPages, topPagesPower)
    steadyStatePower = P * steadyStatePower;
    [topPagesPower, topProbsPower] = getTopPages(steadyStatePower, websites, 10);
    k = k+1;
end