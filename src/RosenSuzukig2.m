function [f, g, G] = RosenSuzukig2(x)
% The function handle of RosenSuzuki g_2
f = -x(1)^2 - x(2)^2 - x(3)^2 - x(4)^2 - x(1)...
      + x(2) - x(3) + x(4) + 8;
g = zeros(4, 1);
G = zeros(4, 4);
g(1) = -2 * x(1) - 1;
g(2) = -2 * x(2) + 1;
g(3) = -2 * x(3) - 1;
g(4) = -2 * x(4) + 1;
G(1, 1) = -2;
G(2, 2) = -2;
G(3, 3) = -2;
G(4, 4) = -2;
end
