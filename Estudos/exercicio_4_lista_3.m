f = [-16 -28 -20]';

%    x1 x2 x3   x4 x5 x6  x7   x8
% f = [1 1.5 0.5 0.75 1 1.5 0.5 0.75]';

%% Restricoes Aeq * x = beq
Aeq = [10 15 40];
Beq = [1]';
%% lb <= x <= ub
lb = [0 0 0]';
ub = [];

%% Restricoes A * x <= b
% Negativo para inverter a inequacao de >= para <=
A = [2 5 -180;
     4 3 -150];

b = [0 0]';

%% Solucao
[x, fval] = linprog(f, A, b, Aeq, Beq, lb, ub)