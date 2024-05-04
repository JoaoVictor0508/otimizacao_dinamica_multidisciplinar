a = 13;
b = 7;
x0 = [1 1];
lb = [0 0];
ub = [a b];
A = []; B = []; Aeq = []; Beq = [];

[x, J] = fmincon(@custo, x0, A, B, Aeq, Beq, lb, ub, @nonlc)

function [c, ceq] = custo(a, b)
    