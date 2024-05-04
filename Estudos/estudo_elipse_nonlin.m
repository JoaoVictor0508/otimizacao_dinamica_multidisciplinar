a = 13;
b = 7;

lb = [0 0]';
ub = [a b]';

x0 = (lb + ub)/2;

[X, FVAL] = fmincon(@nLinCost, x0, [], [], [], [], lb, ub, @nonlcon)

function c = nLinCost(x)
    c = - 4 * x(1) * x(2);
end

function [c, ceq] = nonlcon(x)
    a = 13;
    b = 7;
    c = x(1)^2/a^2 + x(2)^2/b^2 - 1;
    ceq = []
end