function fx = calf(Objf, x, mu)
q = size(Objf, x);
fx = 0;
for i = 1: q
    fxi = feval(Objf{i}, x);
    fx = fx + exp(fxi / mu);
end
fx = mu * log(fx);
end