% Problem 4b original
cost = [50, 6, 35, 60];
upper = [2, 2, 2, 2];
lower = [0, 0, 0, 0];

b = [800, 850];
A = [24, 76, 43, 754; 755, 27, 33, 67];


% Call linprog
options=optimset ('display', 'off');
x = linprog(-cost, A, b, [], [], lower, upper, [], options);
max_val = dot(cost, x)