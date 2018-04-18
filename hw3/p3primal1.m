% Problem 3 primal increase by 1
cost = [11, 5];
upper = [Inf, Inf];
lower = [0, 0];

b = [10, 40];
A = [1, 1; 10, 4];


% Call linprog
options=optimset ('display', 'off');
x = linprog(-cost, A, b, [], [], lower, upper, [], options);
max_val = dot(cost, x)