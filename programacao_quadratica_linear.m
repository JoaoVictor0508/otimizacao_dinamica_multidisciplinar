x = [ 0 1 2 3];
y = [ -1 -0.5 0.5 1];

ft = [0 0 1 1 1 1 1 1 1 1]';

%Restrições A*x = b
A = [];
b = [];

%Restrições Aeq*x = beq
% x = [a    b E1p E2p E3p E4p E1n E2n E3n E4n]
Aeq = [x(1) 1 -1   0   0   0   1   0   0   0;
       x(2) 1  0  -1   0   0   0   1   0   0;
       x(3) 1  0   0   -1  0   0   0   1   0;
       x(4) 1  0   0   0   -1  0   0   0   1];
beq = y';

%LB <= x <= UB
LB = [ -inf;
       -inf;
       0;
       0;
       0;
       0;
       0;
       0;
       0;
       0 ];
Ub = [];

%solver

[Xa,FVAL] = linprog(ft, A, b, Aeq, beq, LB, Ub)
% Ya = Xa(1)*x + Xa(2)