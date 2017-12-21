function fx = calf(Objf, x, mu)
q = size(Objf, 2);
fx = 0;
for i = 1: q
    fxi = feval(Objf{i}, x);
    fx = fx + exp(fxi / mu);
end
fx = mu * log(fx);
end