function lambd = callambda(Objf, x, mu)
p = size(Objf, 2);
lambd = zeros(p, 1);
for i = 1: p
    fxi = feval(Objf{i} , x);
    lambd(i) = exp(fxi / mu);
end
sum_lab = sum(lambd);
lambd = lambd ./ sum_lab;
end