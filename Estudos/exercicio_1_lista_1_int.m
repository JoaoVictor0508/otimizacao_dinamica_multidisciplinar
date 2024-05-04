f = [0.06 0.08]';

%    x1 x2 x3   x4 x5 x6  x7   x8
% f = [1 1.5 0.5 0.75 1 1.5 0.5 0.75]';

%% Restricoes Aeq * x = beq
Aeq = [];
Beq = [];
%% lb <= x <= ub
lb = [0 0]';
ub = [];

intcon = [1 2];

%% Restricoes A * x <= b
% Negativo para inverter a inequacao de >= para <=
A = [-[8 6]
     -[1 2]
     [1 2]];

b = [-48 -12 20]';

%% Solucao
[x, fval] = intlinprog(f, intcon, A, b, Aeq, Beq, lb, ub)