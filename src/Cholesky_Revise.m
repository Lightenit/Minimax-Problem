function [Cholesky_G, pd_flag ,D,  L] = Cholesky_Revise(G, delta)
% Get Revised Cholesky Mat of Hessian G.
% Call : G = Cholesky_Revise(G, delta)

% Input: 
% G : the origin Hessian Mat of Object Function
% delta : parameter in Cholesky Revsion

% Output:
% Cholesky_G : the Revised Mat of G
n = size(G, 1);
gamm = -1;
kex = -1;
for i = 1:n
    for j = 1:n
        if i  == j
            if G(i, j) > gamm
                gamm = G(i, j);
            end
        else
            if G(i, j) > kex
                kex = G(i, j);
            end
        end
    end
end
beta = max(gamm^(0.5), (kex/n)^(0.5));
dd = zeros(1, n);
c = zeros(n);
L = eye(n);
d = zeros(1, n);
theta = zeros(1, n);
pd_flag = 1;
for j = 1:n
    if j > 1
        dd(j) = max(delta, abs(G(j, j) - c(j,1:j - 1).^2 * (1./d(1: j-1))'));
        for i = j+1 : n
            c(i, j ) = G(i, j) - L(j, 1:j-1) * c(i, 1: j-1)';
        end
%         c(j+1:n , j) = G(j+1:n ,j) - ;
    else
        dd(j) = max(delta, abs(G(j, j)));
        c(j+1:n, j) = G(j+1:n, j);
    end
    if j == n
        theta(j) = 0;
    else
        theta(j) = max(abs(c(j+1:n, j)));
    end
    d(j) = max(dd(j), theta(j)^2/(beta^2));
    if d(j) < 0
        pd_flag = 0;
    end
    L(j+1:n, j) = c(j+1:n, j)./d(j);
end
Cholesky_G = L * diag(d) * L';
D = diag(d);
