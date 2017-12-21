function gx = calg(Objf, x, mu)
lambd = callambda(Objf, x, mu);
p = size(Objf, 2);
n = size(x, 1);
gx = zeros(n, 1);
for i = 1 : p
    [ ~ , gxi ] = feval(Objf{i}, x);
    gx = gx + lambd(i) * gxi;
end
end