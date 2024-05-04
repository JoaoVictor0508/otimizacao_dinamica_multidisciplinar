f = [-0.12 -0.35]';

%    x1 x2 x3   x4 x5 x6  x7   x8
% f = [1 1.5 0.5 0.75 1 1.5 0.5 0.75]';

%% Restricoes Aeq * x = beq
Aeq = [];
Beq = [];
%% lb <= x <= ub
lb = [0 0]';
ub = [100000 85000];

%% Restricoes A * x <= b
% Negativo para inverter a inequacao de >= para <=
A = [0.4 0.2; 
     1.0 1.0]

b = [30000 70000]';

%% Solucao
[x, fval] = linprog(f, A, b, Aeq, Beq, lb, ub)