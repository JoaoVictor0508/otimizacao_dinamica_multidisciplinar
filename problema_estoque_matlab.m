
x0 = 1;

[Q, Custo] = fminunc(@objetivo, x0)

function C = objetivo(Q)
    D = 1000;
    C = 50;
    S = 10;
    Cm = 20;
    
    C = D*C +D*S/Q + Q*Cm/2;
end

