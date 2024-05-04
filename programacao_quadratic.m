x = [ 0 1 2 3];
y = [ -1 -0.5 0.5 1];

ft = [];
H = [ 0 0 0 0 0 0;
      0 0 0 0 0 0;
      0 0 2 0 0 0;
      0 0 0 2 0 0;
      0 0 0 0 2 0;
      0 0 0 0 0 2]
% ou H = diag)[0 0 2 2 2 2]);

%Restrições A*x = b
A = [];
b = [];

%Restrições Aeq*x = beq
Aeq = [x(1) 1 -1 0 0 0;
       x(2) 1 0 -1 0 0;
       x(3) 1 0 0 -1 0;
       x(4) 1 0 0 0 -1;];
beq = y';

%LB <= x <= UB
LB = [];
Ub = [];

%solver

[Xa,FVAL] = quadprog(H, ft, A, b, Aeq, beq, LB, Ub)
Ya = Xa(1)*x + Xa(2)

A_1 = [ 0 1; 
        1 1;
        2 1;
        3 1]
B_1 = [-1;
       -0.5; 
       0.5;
       1];

X = inv(A_1' * A_1) * A_1' * B_1

Y2 = A_1\B_1
Y3 = pinv(A_1)*B_1