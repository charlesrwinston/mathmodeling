function y = f3_3prime(x)
if (x >= 0)
    y = 3 * realpow(x,2) + 2 * (5/4) * nthroot(x,4);
else
    y = 3 * realpow(x,2) + 2 * (5/4) * -1 * nthroot(-x,4);
end
end