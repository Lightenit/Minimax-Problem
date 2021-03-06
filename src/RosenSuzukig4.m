function [f, g, G] = RosenSuzukig4(x)
% The function handle of RosenSuzuki g_4
f = -x(1)^2 - x(2)^2 - x(3)^2 - 2 * x(1) ...
      + x(2) + x(4) + 5;
g = zeros(4, 1);
G = zeros(4, 4);
g(1) = -2 * x(1) - 2;
g(2) = -2 * x(2) + 1;
g(3) = -2 * x(3);
g(4) = 1;
G(1, 1) = -2;
G(2, 2) = -2;
G(3, 3) = -2;
G(4, 4) = 0;
end
