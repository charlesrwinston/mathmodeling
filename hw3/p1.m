% Problem 1
cost = [2, 3];
upper = [Inf, Inf];
lower = [0, 0];

b = [-1, 3, 9, 3];
A = zeros(4, 2);

A(1, 1) = -1;
A(1, 2) = -1;
A(2, 1) = -1;
A(2, 2) = 1;
A(3, 1) = 2;
A(3, 2) = 1;
A(4, 1) = 1;
A(4, 2) = -1;



% Call linprog
options=optimset ('display', 'off');
x = linprog(-cost, A, b, [], [], lower, upper, [], options);
max_val = dot(cost, x)