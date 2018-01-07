function gx = calg(Objf, x, mu)
% Calculate the gradient of Objfunction value in the xu-smooth method
% Call: gx = calg(Objf, x, mu)
%
% Input : 
%       Objf : A cell of Object function
%       x : the value of x
%       mu : the value of mu
%
% Output : 
%       gx : the gradient of Object Function in xu method
lambd = callambda(Objf, x, mu);
p = size(Objf, 2);
n = size(x, 1);
gx = zeros(n, 1);
for i = 1 : p
    [ ~ , gxi ] = feval(Objf{i}, x);
    gx = gx + lambd(i) * gxi;
end
end