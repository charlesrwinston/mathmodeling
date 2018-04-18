function y = f3_3(x)
if (x >= 0)
    y = realpow(x,3) + 2 * realpow(nthroot(x,4),5);
else
    y = realpow(x,3) + 2 * realpow(-1,5) * realpow(nthroot(-x,4),5);
end
end