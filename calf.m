function fx = calf(Objf, x, mu)
q = size(Objf, 2);
maxf = -10000;
for i = 1 : q
    if feval(Objf{i}, x) > maxf
        maxf = feval(Objf{i} , x);
    end
end
fx = 0;
for i = 1: q
    fxi = feval(Objf{i}, x);
    fx = fx + exp((fxi - maxf)/ mu);
end
fx = mu * log(fx) + maxf;
end