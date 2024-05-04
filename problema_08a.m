%% problema_08a  (ajuste de curva QUADRÁTICO)
%  MATLAB & OCTAVE

%       [X,FVAL] = quadprog(H, f, A, b, Aeq, beq, LB, UB) 
%       min 0.5*x'*H*x + f'*x   subject to:    A*x <= b
%        x                                   Aeq*x = beq
%                                          LB <= x <= UB
    clear,clc
    x = [    0    1    2    3 ];
    y = [ -1.0 -0.5  0.5  1.0 ];

%% Função Objetivo
%       x = [ a  b  E1  E2  E3 E4 ]
        f = [ 0  0  0   0   0  0  ]';
        H = diag([0 0 2 2 2 2]);
    
%% Restrições A*x <= b
        A = [];
        b = [];
    
%% Restrições Aeq*x = beq
%       x = [    a  b   E1   E2   E3   E4 ]

      Aeq = [ x(1)  1   -1    0    0    0  
              x(2)  1    0   -1    0    0  
              x(3)  1    0    0   -1    0  
              x(4)  1    0    0    0   -1 ];

      beq =  y';
  
%%  LB <= x <= UB
     LB = [];
     UB = [];
  
%% solver
    [Xa,FVAL] = quadprog(H, f, A, b, Aeq, beq, LB, UB)
     Ya = Xa(1)*x + Xa(2);
    
%% mínimos quadrados
%   [ x' ones(4,1) ]*[a b]' = y'
    Xc = inv( [ x' ones(4,1) ]'*[ x' ones(4,1) ] )*[ x' ones(4,1) ]'*y'
    Yc = Xc(1)*x + Xc(2);
   
%% comparação 
    problema_08
    figure(1)
    plot(x,y,x,Y,x,Ya,x,Yc,'o','linewidth',2)
    axis([0 3 -1.1  1.1])
    grid
    legend('original','linear','quadratico','least square','Location','northwest') 
    
  