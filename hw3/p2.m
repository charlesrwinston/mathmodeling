% Problem 2
cost = [200, 300];
upper = [Inf, Inf];
lower = [0, 0];

b = [100, 120, 45];
A = [3, 2; 2, 4; 1, 1];


% Call linprog
options=optimset ('display', 'off');
x = linprog(-cost, A, b, [], [], lower, upper, [], options);
max_val = dot(cost, x)