function [x, k] = p1a()
[x, k] = newton(@f1a, @f1prime, 1/500);
end