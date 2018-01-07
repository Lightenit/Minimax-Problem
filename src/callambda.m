function lambd = callambda(Objf, x, mu)
% Calculate the value of lambda in the Objfunction value in the xu-smooth method
% Call: lambda = callambda(Objf, x, mu)
%
% Input : 
%       Objf : A cell of Object function
%       x : the value of x
%       mu : the value of mu
%
% Output : 
%       lambd : the value of lambda in the Object Function in xu method
p = size(Objf, 2);
maxf = -10000;
for i = 1 : p
    if feval(Objf{i}, x) > maxf
        maxf = feval(Objf{i} , x);
    end
end
lambd = zeros(p, 1);
for i = 1: p
    fxi = feval(Objf{i} , x);
    lambd(i) = exp((fxi - maxf) / mu);
end
sum_lab = sum(lambd);
lambd = lambd ./ sum_lab;
end