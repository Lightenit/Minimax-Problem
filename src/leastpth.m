function [exit_code, xstar, fstar, feval_num, iter_num] = leastpth(Objf, p, epsilon)
% Using least pth method to solve minimax problem.
% Call: [exit_code, xstar, fstar, feval_num, iter_num] = leastpth(Objf, p, epsilon)
%
% Input: 
%      Objf: A cell of Object function
%      p : the initial point of x
%      epsilon : Rule to stop the iteration
%
% Output :
% exit_call : Boolian Var, whether we get the optimizer point of Object
%                      Function
% xstar : the Optimizer point of Object Function
% f_star : the function value at xstar
% ite_num : the number of iteration
% feval_num : the number of feval
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
maxf = -10000;
for i = 1: m
    if feval(Objf{i}, x) > maxf
        maxf = feval(Objf{i}, x);
    end
end
fstar = maxf;
end