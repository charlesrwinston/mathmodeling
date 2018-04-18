function [x_newton, k_newton, x_halley, k_halley, x_bisect, k_bisect, x_secant, k_secant] = p3_2()
[x_newton, k_newton] = newton(@f3_2, @f3_2prime, 20);
[x_halley, k_halley] = halley(@f3_2, @f3_2prime, @ddf3_2, 20);
[x_secant, k_secant] = secant(@f3_2, -1, 20);
[x_bisect, k_bisect] = bisection(@f3_2, -1, 20);
end