%% problema_08  (ajuste de curva LINEAR)
%  MATLAB & OCTAVE

%       [X,FVAL] = linprog(f, A, b, Aeq, beq, LB, UB) 
%            min f'*x    subject to:    A*x <= b
%             x                       Aeq*x = beq
%                                   LB <= x <= UB

    x = [    0    1    2    3 ];
    y = [ -1.0 -0.5  0.5  1.0 ];

%% Função Objetivo
%       x = [ a  b  E1p  E1n  E2p  E2n  E3p  E3n  E4p  E4n ]
        f = [ 0  0   1    1    1    1    1    1    1    1  ]';
    
%% Restrições A*x <= b
        A = [];
        b = [];
    
%% Restrições Aeq*x = beq
%       x = [   a   b  E1p  E1n  E2p  E2n  E3p  E3n  E4p  E4n  ]

      Aeq = [ x(1)  1   -1    1    0    0    0    0    0    0  
              x(2)  1    0    0   -1    1    0    0    0    0  
              x(3)  1    0    0    0    0   -1    1    0    0 
              x(4)  1    0    0    0    0    0    0   -1    1  ];

      beq =  y';
  
 %%  LB <= x <= UB
     LB = [ -inf -inf  0 0 0 0 0 0 0 0]';
     UB = [];
  
 %% solver
    [X,FVAL] = linprog(f, A, b, Aeq, beq, LB, UB) 

 %% comparação 
    Y = X(1)*x + X(2);
    figure(1)
    plot(x,y,x,Y,'linewidth',2)
    axis([0 3 -1.1  1.1])
    grid
    legend('original','linear')
    
  