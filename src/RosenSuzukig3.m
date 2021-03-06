function [f, g, G] = RosenSuzukig3(x)
% The function handle of RosenSuzuki g_3
f = -x(1)^2 - 2 * x(2)^2 - x(3)^2 - 2 * x(4)^2 ...
      + x(1) + x(4) + 10;
g = zeros(4, 1);
G = zeros(4, 4);
g(1) = -2 * x(1) + 1;
g(2) = -4 * x(2);
g(3) = -2 * x(3);
g(4) = -4 * x(4) + 1;
G(1, 1) = -2;
G(2, 2) = -4;
G(3, 3) = -2;
G(4, 4) = -4;
end
