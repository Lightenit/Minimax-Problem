function [exit_code, xstar, fstar, feval_num, iter_num] = leastpth(Objf, p, epsilon)
x  = p;
feval_num = 0;
iter_num = 0;
m = size(Objf, 2);
% S_mask = ones(m, 1);
% r = 1;
pp = 2;
u = ones(m, 1);
error = 1;
xi = 0;
c =1;
lambd = 0.5;
while error > epsilon
    [x, u, xi, feval_nu, error, fstar] = GetUOptimal(Objf, x, u, pp, xi, lambd);
    pp = c * pp;
    feval_num = feval_num + feval_nu;
    iter_num = iter_num + 1;
end
exit_code = 1;
xstar = x;
end