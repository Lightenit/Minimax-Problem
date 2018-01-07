function [f, g, G] = xu21(x)
% The function handle of f_1 in Xu example 2
f = x(1)^4 + x(2)^2;
g = zeros(2,1);
g(1) = 4 * x(1)^3;
g(2) = 2 * x(2);
G = zeros(2,2);
G(1, 1) = 12 * x(1)^2;
G(2, 2) = 2;
end