function [x,k] = newton(f,df,x0)
% Computes iterates of Newton's method for solving f(x) = 0
% returns iterate where |f(x_k)| < 1e-10 or k=100
% Input: 
%        f  = function handle for function
%        df = function handle for derivative of function
%        x0 = Initial guess for root
% Output: 
%        x  = Approximation of root
%        k  = Total number of Iterations needed

% Maximum number of Newton Steps to perform
maxsteps = 100; 
% Stopping tolerance check: if |f(x)| < tol, we are close enough
tol = 1e-10;  

% Initialize values
k = 0;
x = x0;
x_prev = -1;

%while ((k < maxsteps) && abs(f(x)) > tol)
while ((k < maxsteps) && abs(x - x_prev) > tol)
    disp(abs(x - x_prev))
    % Compute next iterate
    x_prev = x;
    x = x - f(x)/df(x);
    k = k+1;
end
disp(abs(x - x_prev))

end