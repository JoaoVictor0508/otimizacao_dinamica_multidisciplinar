f = [1 1.5 0.5 0.75 1 1.5 0.5 0.75]';

Aeq = [1 1 1 1 0 0 0 0;
       0 0 0 0 1 1 1 1];
Beq = [100;
       250]

lb = [0 0 0 0 0 0 0 0]';
ub = []

A = [-[0.75 -0.25 0.35 0.05 0 0 0 0]
     -[-0.5 0.5 -0.1 0.2 0 0 0 0]
     -[0 0 0 0 0.8 -0.2 0.4 0.1]
      [0 0 0 0 -0.5 0.5 -0.1 0.2]];

B = [0 0 0 0]';

[x, fval] = linprog(f, A, B, Aeq, Beq, lb, ub)