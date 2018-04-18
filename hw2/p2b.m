function [x_newton, k_newton, x_halley, k_halley, x_bisect, k_bisect, x_secant, k_secant] = p2b()
[x_newton, k_newton] = newton(@f2b, @f2prime, 5);
[x_halley, k_halley] = halley(@f2b, @f2prime, @ddf2, 5);
[x_secant, k_secant] = secant(@f2b, 0, 10);
[x_bisect, k_bisect] = bisection(@f2b, 0, 30);
end