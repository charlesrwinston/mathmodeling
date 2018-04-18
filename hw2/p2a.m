function [x_newton, k_newton, x_halley, k_halley, x_bisect, k_bisect, x_secant, k_secant] = p2a()
[x_newton, k_newton] = newton(@f2a, @f2prime, 5);
[x_halley, k_halley] = halley(@f2a, @f2prime, @ddf2, 5);
[x_secant, k_secant] = secant(@f2a, 0, 10);
[x_bisect, k_bisect] = bisection(@f2a, 0, 20);
end