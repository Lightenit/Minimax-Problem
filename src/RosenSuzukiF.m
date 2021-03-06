function [f, g, G] = RosenSuzukiF(x)
% The function handle of RosenSuzuki F_1
f = x(1)^2 + x(2)^2 + 2 * x(3)^2 + x(4)^2 -...
       5 * x(1) - 5 * x(2) - 21 * x(3) + 7 * x(4);
g = zeros(4, 1);
G = zeros(4, 4);
g(1) = 2 * x(1) - 5;
g(2) = 2 * x(2) - 5;
g(3) = 4 * x(3) - 21;
g(4) = 2 * x(4) + 7;
G(1, 1) = 2;
G(2, 2) = 2;
G(3, 3) = 4;
G(4, 4) = 2;
end
