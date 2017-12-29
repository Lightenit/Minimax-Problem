function [exit_code, xstar, fstar, feval_num, iter_num] = xusmooth(Objf, p, epsilon, mu, bet)
q = size(Objf, 2);
iter_num =0;
feval_num  = 1;
error = 1;
x = p;
fx= calf(Objf, x, mu);
gx = calg(Objf, x, mu);
Gx = calHe(Objf, x, mu);
while error > epsilon
%     d = - gx / Gx;
%     d = - inv(Gx) * gx;
    d = - (Gx + 1e-6 * eye(size(x, 1))) \ gx;
    [stepsize, feval_nu] = ArmijoRule(Objf, x, d, 1, 0.8, 0.1, mu);
    x = x + stepsize * d;
    nfx = calf(Objf, x, mu);
    gx = calg(Objf, x, mu);
    Gx = calHe(Objf, x, mu);
    error = abs(nfx - fx);
    fx = nfx;
    mu = bet * mu;
    iter_num = iter_num + 1;
    feval_num  = feval_num  + feval_nu;
end
maxf = -10000;
for i = 1: q
    if feval(Objf{i}, x) > maxf
        maxf = feval(Objf{i}, x);
    end
end
xstar = x;
fstar = maxf;
exit_code = 1;
end