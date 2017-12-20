function [exit_code, feval_num] = ArmijoTest(Objf, x, d, step, ph, mu)
% Test whether the stepsize satisified the Armijo Rule
% Call :  [exit_code, feval_num] = ArmijoTest(Objf, x, d, step, ph)

% Input:
% Objf : the Object function
% x : point
% d : descent direction
% step : Stepsize
% ph : parameter of Armijo Rule

% Output:
% exit_code : whether the Rule is satisified
% feval_num : the number of evaluation times of Objf
feval_num = 2;
fk = calf(Objf, x, mu);
gk = calg(Objf, x, mu);
nfk = calf(Objf, x + step * d, mu);
% ngk = calg(Objf, x + step * d, mu);
% [fk, gk] = feval(Objf, x);
% [nfk, ngk] = feval(Objf, x + step * d);
if (nfk <= fk + ph * gk' * d * step)
    exit_code = 1;
else
    exit_code = 0;
end
end
