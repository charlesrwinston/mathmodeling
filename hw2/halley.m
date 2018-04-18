function [x,k] = halley(f,df,ddf,x0)
% Computes iterates of Halley's method for solving f(x) = 0
% returns iterate where |f(x_k)| < 1e-10 or k=100
%        f  = function handle for function
%        df = function handle for derivative of function
%        ddf = function handle for 2nd derivative of function
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

while ((k < maxsteps) && abs(f(x)) > tol)
    % Compute next iterate
    x = x - (2*f(x)*df(x))/(2*(df(x))^2 - f(x)*ddf(x));
    k = k+1;
end

end