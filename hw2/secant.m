function [x_new,k] = secant(f,x0,x1)
% Computes iterates of the secant method for solving f(x) = 0
% returns iterate where |f(x_k)| < 1e-10 or k=100
% Input: 
%        f  = function handle for function
%        x0 = First Initial Guess for root
%        x1 = Second Initial guess for root
% Output: 
%        x_new  = Approximation of root
%        k      = Total number of Iterations needed

% Maximum number of Secant Method Steps to perform
maxsteps = 100; 
% Stopping tolerance check: if |f(x)| < tol, we are close enough
tol = 1e-10; 

% Initialize values
k = 0;
x_old = x0;
x_new = x1;
f_old = f(x0);
f_new = f(x1);

while ((k < maxsteps) && abs(f_new) > tol)
    % compute new value and update stored values
    x_next = x_new - f_new*(x_new-x_old)/(f_new-f_old);
    f_old = f_new;
    f_new = f(x_next);
    x_old = x_new;
    x_new = x_next;
    k = k+1;
end

end