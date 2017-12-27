function lambd = callambda(Objf, x, mu)
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