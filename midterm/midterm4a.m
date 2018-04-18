% Shipping costs to LA doubled

cost = [ 0, 0, 0, 6, 6, 3, 7, 2, 14, 5, 4, 6, 7, 4, 10, 6, 2, 4, 5, 2, 0, 0, 0, 0, 0 ];
upper = [ 700, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 150, 300, 250, 200, 200 ];
lower = [ 700, 200, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 300, 250, 200, 200 ];

beq = zeros(8, 1);
Aeq = zeros(8, 25);

% Santa Fe Conservation Constraints
Aeq(1, 1) = 1;
Aeq(1, 4) = -1;
Aeq(1, 5) = -1;
Aeq(1, 6) = -1;
Aeq(1, 7) = -1;

% El Paso Conservation Constraints
Aeq(2, 2) = 1;
Aeq(2, 8) = -1;
Aeq(2, 9) = -1;
Aeq(2, 10) = -1;

% Tamba Bay Conservation Constraints
Aeq(3, 3) = 1;
Aeq(3, 11) = -1;
Aeq(3, 12) = -1;
Aeq(3, 13) = -1;

% Houston Conservation Constraints
Aeq(4, 6) = 1;
Aeq(4, 8) = 1;
Aeq(4, 12) = 1;
Aeq(4, 14) = -1;
Aeq(4, 15) = -1;
Aeq(4, 16) = -1;
Aeq(4, 17) = -1;
Aeq(4, 20) = 1;
Aeq(4, 22) = -1;

% Atlanta Conservation Constraints
Aeq(5, 7) = 1;
Aeq(5, 10) = 1;
Aeq(5, 11) = 1;
Aeq(5, 17) = 1;
Aeq(5, 18) = -1;
Aeq(5, 19) = -1;
Aeq(5, 20) = -1;
Aeq(5, 21) = -1;

% Chicago Conservation Constraints
Aeq(6, 4) = 1;
Aeq(6, 14) = 1;
Aeq(6, 18) = 1;
Aeq(6, 25) = -1;

% LA Conservation Constraints
Aeq(7, 5) = 1;
Aeq(7, 9) = 1;
Aeq(7, 15) = 1;
Aeq(7, 24) = -1;

% NY Conservation Constraints
Aeq(8, 13) = 1;
Aeq(8, 16) = 1;
Aeq(8, 19) = 1;
Aeq(8, 23) = -1;


% Call linprog
options=optimset ('display', 'off');
x = linprog(cost, [], [], Aeq, beq, lower, upper, [], options);
min_cost = dot(cost, x)