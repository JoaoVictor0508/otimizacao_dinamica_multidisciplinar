f = [50 90 120 65 92 140]';

%    x1 x2 x3   x4 x5 x6  x7   x8
% f = [1 1.5 0.5 0.75 1 1.5 0.5 0.75]';

%% Restricoes Aeq * x = beq
Aeq = [1 0 0 1 0 0;
       0 1 0 0 1 0;
       0 0 1 0 0 1];
Beq = [3000 2500 500]';
%% lb <= x <= ub
lb = [0 0 0 0 0 0]';
ub = [];

intcon = [1 2 3 4 5 6];

%% Restricoes A * x <= b
% Negativo para inverter a inequacao de >= para <=
A = [1 2 0.5 0 0 0;
     2.5 1 4 0 0 0];

b = [6000 10000]';

%% Solucao
[x, fval] = intlinprog(f, intcon, A, b, Aeq, Beq, lb, ub)