%% Problema Furadeiras
%
%             | Tipo 1 | Tipo 2 | Tipo 3    |/disp.
% Montagem    | 2h/pç  | 3h/pç  |  2.5h/pç  | 600h
% Pintura     | 3h/pç  | 2h/pç  | 2.5h/pç   | 500h
% Lucro Unit. |   $50  |  $60   | $65       | N.A.
% Preparacao  |  $5000 | $4000  | $3000     | N.A.
%
% 3 tipos de furadeira, só uma será produzida
%
% ------------------------ SOLUCAO -------------------------------
% Variaveis
% x1 = n furadeiras fabricadas tipo 1 |
% x2 = n furadeiras fabricadas tipo 2 |-> inteiras
% x3 = n furadeiras fabricadas tipo 3 |
%
% y1 = | = 0, nao fabrica tipo 1      |
%      | = 1, fabrica tipo 1          |-> binária (0 <= int <= 1)
%
% y2 = | = 0, nao fabrica tipo 2      |
%      | = 1, fabrica tipo 2          |-> binária
%
% y3 = | = 0, nao fabrica tipo 3      |
%      | = 1, fabrica tipo 3          |-> binária
%
% Objetivo
% max L = 50*x1 + 60*x2 + 65*x3 - (y1*5000 + y2*4000 + y3*3000)
%       s.t. 2*x1 + 3*x2 + 2.5*x3 <= 600
%            3*x1 + 2*x2 + 2.5*x3 <= 500
%            0 <= x1 <= 9999*y1  |
%            0 <= x2 <= 9999*y2  |
%            0 <= x3 <= 9999*y3  |-> restricoes lineares, nao precisa 
%                                    multiplicar xn*yn no objetivo
%% 
%    X = intlinprog(f,intcon,A,b) attempts to solve problems of the form
% 
%             min f'*x    subject to:  A*x  <= b
%              x                       Aeq*x = beq
%                                      lb <= x <= ub
%                                      x(i) integer, where i is in the index
%                                      vector intcon (integer constraints)
%% f -> max
f = -[50 60 65 -5000 -4000 -3000]';
%% intcon
intcon = [1 2 3 4 5 6];
%% A*x <= b
A = [[2 3 2.5 0 0 0]
    [3 2 2.5 0 0 0]
    [1 0 0 -9999 0 0]
    [0 1 0 0 -9999 0]
    [0 0 1 0 0 -9999]];
b = [600 500 0 0 0]';
%% Aeq*x = beq
Aeq = [];
beq = [];
%% lb <= x <= ub
lb = zeros(6,1);
ub = [inf inf inf 1 1 1]';
%%
[X, FVAL] = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)
v1 = [A*X b]
% v2 = [Aeq*X beq]