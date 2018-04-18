function [P, t_time, steadyState, s_time, topPages, topProbs, steadyStatePower, topPagesPower, topProbsPower, k, p_time] = compareEigPower(siteGraph, websites, p)

[P, t_time] = getTransitionMatrix(siteGraph, p);
[steadyState, s_time] = getSteadyState(P);
[topPages, topProbs] = getTopPages(steadyState, websites, 10);
tic;
[steadyStatePower, topPagesPower, topProbsPower, k] = powerMethod(P, websites, topPages);
p_time = toc;

end