function [steadyState, time] = getSteadyState(P)

tic;
[V, D] = eig(P);
sm = sum(V(:,1));
steadyState = V(:,1)/sm;
time = toc;

end