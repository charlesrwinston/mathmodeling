function [x_newton, k_newton, x_halley, k_halley, x_bisect, k_bisect, x_secant, k_secant] = p3_3()
[x_newton, k_newton] = newton(@f3_3, @f3_3prime, 20);
[x_halley, k_halley] = halley(@f3_3, @f3_3prime, @ddf3_3, 20);
[x_secant, k_secant] = secant(@f3_3, -1, 20);
[x_bisect, k_bisect] = bisection(@f3_3, -1, 20);
end