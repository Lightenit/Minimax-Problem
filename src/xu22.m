function [f, g, G] = xu22(x)
% The function handle of f_2 in Xu example 2
f = (2 - x(1))^2 + (2 - x(2))^2;
g = zeros(2, 1);
g(1) = -2 * (2 - x(1));
g(2) = -2 * (2 - x(2));
G = zeros(2, 2);
G(1, 1) = 2;
G(2, 2) = 2;
end
