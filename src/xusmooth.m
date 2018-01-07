function [exit_code, xstar, fstar, feval_num, iter_num] = xusmooth(Objf, p, epsilon, mu, bet)
% Using Xu smooth method to solve minimax problem.
% Call: [exit_code, xstar, fstar, feval_num, iter_num] = xusmooth(Objf, p, epsilon, mu, bet)
%
% Input: 
%      Objf: A cell of Object function
%      p : the initial point of x
%      epsilon : Rule to stop the iteration
%      mu : the initial value of mu
%      bet : the beta value, mu = bet * mu
%
% Output :
% exit_call : Boolian Var, whether we get the optimizer point of Object
%                      Function
% xstar : the Optimizer point of Object Function
% f_star : the function value at xstar
% ite_num : the number of iteration
% feval_num : the number of fevalq = size(Objf, 2);
iter_num =0;
feval_num  = 1;
error = 1;
x = p;
fx= calf(Objf, x, mu);
gx = calg(Objf, x, mu);
Gx = calHe(Objf, x, mu);
while error > epsilon
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