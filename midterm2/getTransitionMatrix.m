function [P, time] = getTransitionMatrix(G, p)

tic;
q = 1-p;
m = size(G, 1);
n = size(G, 2);
sums = sum(G);
P = G;
for j = 1:n
    if sums(j) ~= 0
        for i = 1:m
            P(i,j) = G(i,j) * 1/sums(j) * p + (1/m) * q;
        end
    else
        for i = 1:m
            P(i,j) = 1/m;
        end
    end
end

time = toc;

end
