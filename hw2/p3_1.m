function [x_newton, k_newton, x_halley, k_halley, x_bisect, k_bisect, x_secant, k_secant] = p3_1()
[x_newton, k_newton] = newton(@f3_1, @f3_1prime, 20);
[x_halley, k_halley] = halley(@f3_1, @f3_1prime, @ddf3_1, 20);
[x_secant, k_secant] = secant(@f3_1, -1, 20);
[x_bisect, k_bisect] = bisection(@f3_1, -1, 20);
end