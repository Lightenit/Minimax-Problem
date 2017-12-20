function [f, g, G] = xu23(x)
f = 2 * exp( - x(1) + x(2));
g = zeros(2, 1);
G = zeros(2, 2);
g(1) = -2 * exp(-x(1) + x(2));
g(2) = 2 * exp(-x(1) + x(2));
G(1, 1) = 2 * exp(-x(1) + x(2));
G(1, 2) = -2 * exp(-x(1) + x(2));
G(2, 1) = -2 * exp(-x(1) + x(2));
G(2, 2) = 2 * exp(-x(1) + x(2));
end
