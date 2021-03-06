function f = U(x, Objf, u, pp, xi)
% The function handle of U function in least pth
% Call : f = U(x, Objf, u, pp, xi)
%
% Input :
%     x : the value of x
%     Objf : the cell of Object Function
%     pp : the p value in U function
%     xi : the xi value in U function
%
% Output : 
%     f : the function value of U function
M = -10000;
m = size(Objf, 2);
for i = 1: m
    temp_m = feval(Objf{i} , x) - xi;
    if temp_m > M
        M = temp_m;
    end
end
q = pp * sign(M);
if M > 0
    S_mask = zeros(m ,1);
    for i = 1 : m
        if feval(Objf{i}, x) - xi > 0
            S_mask(i) = 1;
        end
    end
else
    S_mask = ones(m, 1);
end
if M == 0
    f = 0;
else
    f = 0;
    for i = 1:m
        if S_mask(i) > 0.5
            f = f + u(i) * (((feval(Objf{i}, x) - xi)/M)^q);
        end
    end
    f = M * f^(1/q);
end
end