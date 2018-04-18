function y = ddf3_3(x)
if (x >= 0)
    y = 6 * x + 2 * (5/16) * (1 / realpow(nthroot(x,4), 3));
else
    y = 6 * x + 2 * (5/16) * (1 / (realpow(-1,3) * realpow(nthroot(-x,4), 3)));
end
end