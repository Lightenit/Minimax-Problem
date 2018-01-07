function [u, new_xi] = updateUxi(Objf, x, u, pp, xi, lambd)
% update of u_i and xi in U function
% Call : [u, new_xi] = updateUxi(Objf, x, u, pp, xi, lambd)
%
% Input : 
%       Objf : The cell of Object Function
%       x : the value of x
%       u : the old u_i
%       pp : the p value in U function
%       xi : the old xi
%       lambd : the lambd value in U function
%       
% Output:
%       u : the new u_i
%       new_xi : the new xi value
m = size(Objf, 2);
v = zeros(m ,1);
M = -10000;
for i = 1 : m
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
if sum(v) == 0
    v = ones(m, 1);
end
u = v ./ sum(v);
if M < 0 
    new_xi = xi + M;
else
    new_xi = xi + lambd * M;
end
end