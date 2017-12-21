function [u, new_xi] = updateUxi(Objf, x, u, pp, xi, lambd)
m = size(Objf, 2);
v = zeros(m ,1);
M = -100;
m = size(Objf, 2);
for i = 1: m
    temp_m = feval(Objf{i} , x) - xi;
    if temp_m > M
        M = temp_m;
    end
end
q = pp * sign(M);
for i = 1 : m
    if feval( Objf{i} , x) - xi > 0
        v(i) = u(i) * ( ( (feval(Objf{i}, x) - xi) / M )^(q - 1) );
    end
end
u = v ./ sum(v);
if M < 0 
    new_xi = xi + M;
else
    new_xi = xi + lambd * M;
end
end