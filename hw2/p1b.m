function [x, k] = p1b()
[x, k] = newton(@f1b, @f1prime, 1/500);
end