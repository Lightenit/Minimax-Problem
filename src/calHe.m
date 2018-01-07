function G  = calHe(Objf, x, mu)
% Calculate the Hessian Matrix of Objfunction value in the xu-smooth method
% Call: G = calHe(Objf, x, mu)
%
% Input : 
%       Objf : A cell of Object function
%       x : the value of x
%       mu : the value of mu
%
% Output : 
%       G : the Hessian Matrix of Object Function in xu method
p = size(Objf, 2);
n = size(x, 1);
G = zeros(n, n);
lambd = callambda(Objf, x, mu);
gx = calg(Objf, x, mu);
% [fx, gx, Gx] = filterphi(x, 0);
for i = 1: p
    [~, gxi, Gxi] = feval(Objf{i}, x);
    G = G + lambd(i) * Gxi + (lambd(i) * (gxi * gxi'))/mu;
end
G = G - (gx * gx')/mu;
end